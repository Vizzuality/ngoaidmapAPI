module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        @projects = Project.fetch_all(project_params)
        render json: @projects, root: 'data', meta: {total: @projects.length}, include: ['organization', 'sectors', 'donors', 'countries', 'regions']
      end

      def project_params
        params.permit(:format, organizations:[], sectors:[], donors:[], countries:[], regions:[])
      end
    end
  end
end