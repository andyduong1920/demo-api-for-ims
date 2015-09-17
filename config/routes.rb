Rails.application.routes.draw do
  
  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :comments
    resources :posts do
      resources :comments
    end
  end
end
