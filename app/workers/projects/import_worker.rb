module Projects
  class ImportWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform
      projects = projects_from_api
      while !projects['paging']['next'].nil? || page == 1
        projects['data'].each { |project| create_project(project) }
        @page += 1
        projects = projects_from_api
      end
    end

    private

    def create_project(project_from_api)
      Project.create(id: project_from_api['id'], name: project_from_api['name'])
    end

    def projects_from_api
      client.get_projects page: page
    end

    def client
      @client ||= TenThousandFeet.new auth: ENV['TEN_THOUSAND_FEET_AUTH']
    end

    def page
      @page ||= 1
    end
  end
end
