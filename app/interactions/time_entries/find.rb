module TimeEntries
  class Find < ActiveInteraction::Base
    integer :id

    def execute
      TimeEntry.find(id)
    end
  end
end
