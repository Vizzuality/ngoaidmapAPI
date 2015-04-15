module Api
  module V1
    class ProjectsController < ApiController
      @projects = Project.all
      respond_to :json
    end
  end
end