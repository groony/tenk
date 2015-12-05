module Projects
  module Users
    class ImportWorker
      include Sidekiq::Worker
      sidekiq_options retry: false

      def perform
        projects.each { |project| process_project(project) }
      end

      private

      def process_project(project)
        projects_users = projects_users_from_api(project.id)
        while projects_users['data'].count > 0 || page == 1
          process_projects_users_form_api(projects_users['data'], project)
          @page += 1
          projects_users = projects_users_from_api(project.id)
        end
        @page = 1
      end

      def process_projects_users_form_api(users, project)
        uniq_users = users.uniq { |u| u['id'] }
        uniq_users.each { |user| create_projects_user(user, project) }
      end

      def create_projects_user(user, project)
        project.projects_users.new(user: ::User.find(user['id'])).save
      end

      def projects_users_from_api(project_id)
        client.get_project_users project_id, page: page
      end

      def client
        @client ||= TenThousandFeet.new auth: ENV['TEN_THOUSAND_FEET_AUTH']
      end

      def page
        @page ||= 1
      end

      def projects
        @projects ||= Project.all
      end
    end
  end
end
