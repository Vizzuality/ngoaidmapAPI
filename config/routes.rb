Rails.application.routes.draw do
  namespace :api, path: nil, defaults: {format: 'json'} do
    #scope module: :v1, constraints: APIVersion.new(version: 1) do
    scope module: :v1 do
      resources :projects
    end
  end
  root 'welcome#index'
end
