class WelcomeController < ApplicationController
  def index
    render json: {message: "Welcome to NGO Aid Map API"}
  end
end
