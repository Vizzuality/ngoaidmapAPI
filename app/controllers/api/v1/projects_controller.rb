module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        @projects = Project.fetch_all(project_params).limit(10)
        render json: @projects
      end

      def project_params
        params.permit(organizations:[])
      end
    end
  end
end