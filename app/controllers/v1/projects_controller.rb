module V1
  class ProjectsController < ApplicationController
      @projects = Project.all
      respond_to :json
  end
end
