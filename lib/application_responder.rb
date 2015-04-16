class ApplicationResponder < ActionController::Responder
  include Responders::CollectionResponder
  include Responders::HttpCacheResponder
  include Responders::LocationResponder
  include ActionController::RespondWith
end
