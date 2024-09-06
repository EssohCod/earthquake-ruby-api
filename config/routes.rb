Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  use_doorkeeper
  devise_for :users

  mount GrapeSwaggerRails::Engine => '/swagger'

  namespace :api do
    namespace :v1 do
      resources :earthquakes, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
