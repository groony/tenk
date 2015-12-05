class ProjectsController < ApplicationController
  def index
    @projects = Projects::List.run!(params)
  end
end
