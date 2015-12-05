module TimeEntries
  class Update < ActiveInteraction::Base
    object :time_entry
    float :estimate_hours, default: 0

    def execute
      time_entry.assign_attributes(estimate_hours: estimate_hours)
      errors.merge!(time_entry.errors) unless time_entry.save
      time_entry
    end
  end
end
