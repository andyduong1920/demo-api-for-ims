Rails.application.routes.draw do
  
  devise_for :users
  
  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :errors
    resources :sessions, only: [:create, :destroy]
    resources :users, only: :create
    resources :comments
    resources :posts do
      resources :comments
    end
    match "*path", to: "errors#catch_404", via: :all
  end
end
