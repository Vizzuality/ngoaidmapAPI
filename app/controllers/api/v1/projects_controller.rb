module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        @projects = Project.fetch_all(project_params)
        render json: @projects, root: 'projects', meta: {total: @projects.length}
      end

      def project_params
        params.permit(organizations:[], sectors:[], donors:[], countries:[], regions:[])
      end
    end
  end
end