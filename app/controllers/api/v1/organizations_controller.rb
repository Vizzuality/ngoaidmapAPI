module Api
  module V1
    class OrganizationsController < ApplicationController
      def show
        @organization = Organization.find(params[:id])
        render json: @organization, root: 'data', include: ['projects']
      end
    end
  end
end