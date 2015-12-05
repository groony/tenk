module Projects
  class Find < ActiveInteraction::Base
    integer :id

    def execute
      Project.find(id)
    end
  end
end
