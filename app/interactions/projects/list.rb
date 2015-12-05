module Projects
  class List < ActiveInteraction::Base
    integer :page, default: 1

    def execute
      Project.paginate(page: page)
    end
  end
end
