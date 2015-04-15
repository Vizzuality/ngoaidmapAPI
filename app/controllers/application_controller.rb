class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::StrongParameters
  include ActionController::Caching
end
