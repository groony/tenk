class ProjectsController < ApplicationController
  def index
    @projects = Projects::List.run!(params)
  end

  def show
    @project = Projects::Find.run!(params)
  end
end
