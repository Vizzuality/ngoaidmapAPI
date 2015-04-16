module Api
  module V1
    class ProjectsController < ApplicationController
        @projects = Project.all
        render json: @projects
    end
  end
end
