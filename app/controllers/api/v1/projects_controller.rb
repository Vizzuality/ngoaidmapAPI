module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        @projects = Project.all.limit(10)
        render json: @projects
      end
    end
  end
end
