class TimeEntriesController < ApplicationController
  before_action :find_time_entry!, only: :edit
  def edit
  end

  private

  def find_time_entry!
    @time_entry = TimeEntries::Find.run!(params)
  end
end
