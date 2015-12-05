class TimeEntriesController < ApplicationController
  before_action :find_time_entry!, only: :edit
  def edit
  end

  def update
    inputs = { time_entry: find_time_entry! }.merge(params[:time_entry])
    outcome = TimeEntries::Update.run(inputs)
    if outcome.valid?
      redirect_to project_path(outcome.result.project)
    else
      render :edit
    end
  end

  private

  def find_time_entry!
    @time_entry = TimeEntries::Find.run!(params)
  end
end
