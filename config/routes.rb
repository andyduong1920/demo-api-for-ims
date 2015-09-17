Rails.application.routes.draw do
  
  devise_for :users
  
  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :users, only: :create
    resources :comments
    resources :posts do
      resources :comments
    end
  end
end
