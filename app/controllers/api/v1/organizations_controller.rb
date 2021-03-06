module Api
  module V1
    class OrganizationsController < ApplicationController
      def index
        @organizations = Organization.active.order(:name)
        render json: @organizations, root: 'data',
        meta: { total: @organizations.size },
        each_serializer: OrganizationPreviewSerializer
      end
      def show
        @organization = Organization.eager_load([projects:[:donors, :sectors, :countries, :regions]]).find(params[:id])
        render json: @organization, root: 'data', include: ['projects']
      end
    end
  end
end