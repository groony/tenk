module Users
  class ImportWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform
      users = users_from_api
      while !users['paging']['next'].nil? || page == 1
        users['data'].each { |user| create_user(user) }
        @page += 1
        users = users_from_api
      end
    end

    private

    def create_user(user_from_api)
      User.create(id: user_from_api['id'], first_name: user_from_api['first_name'],
                  last_name: user_from_api['last_name'])
    end

    def users_from_api
      client.get_users page: page
    end

    def client
      @client ||= TenThousandFeet.new auth: ENV['TEN_THOUSAND_FEET_AUTH']
    end

    def page
      @page ||= 1
    end
  end
end
