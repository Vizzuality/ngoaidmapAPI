module Api
  module V1
    class OrganizationsController < ApplicationController
      def index
        @organizations = Organization.order(:name)
        render json: @organizations, root: 'data',
          meta: { total: @organizations.size },
          each_serializer: OrganizationPreviewSerializer
      end
    end
  end
end
