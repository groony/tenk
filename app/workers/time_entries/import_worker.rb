module TimeEntries
  class ImportWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform
      projects_users.each do |projects_user|
        collect_spent_hours(projects_user)
        create_or_update_time_entry(projects_user)
        @spent_hours = 0
      end
    end

    private

    def collect_spent_hours(projects_user)
      options = { project_id: projects_user.project_id }
      time_entries = time_entries_from_api(projects_user.user_id, options)
      while time_entries['data'].count > 0 || page == 1
        process_time_entries_from_api(time_entries['data'])
        @page += 1
        time_entries = time_entries_from_api(projects_user.user_id, options)
      end
      @page = 1
    end

    def process_time_entries_from_api(time_entries)
      spent_hours
      time_entries.each { |entry| @spent_hours += entry['hours_per_day'].to_f }
    end

    def create_or_update_time_entry(projects_user)
      time_entry = TimeEntry.find_or_create_by(user: projects_user.user, project: projects_user.project)
      time_entry.update_attribute(:spent_hours, spent_hours)
    end

    def time_entries_from_api(user_id, options)
      client.get_assignments(user_id, options.merge(page: page, per_page: 100))
    end

    def client
      @client ||= TenThousandFeet.new auth: ENV['TEN_THOUSAND_FEET_AUTH']
    end

    def page
      @page ||= 1
    end

    def spent_hours
      @spent_hours ||= 0
    end

    def projects_users
      @projects_users ||= Projects::User.all
    end
  end
end
