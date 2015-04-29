Rails.application.routes.draw do
  namespace :api, path: nil, defaults: {format: 'json'} do
    #scope module: :v1, constraints: APIVersion.new(version: 1) do
    scope module: :v1 do
      resources :projects, only: [:index, :show]
      resources :donors, only: [:show]
      resources :organizations, only: [:index, :show]
      resources :sectors, only: [:index, :show]
    end
  end
   mount Raddocs::App => "/docs"
  #root 'welcome#index'
end
