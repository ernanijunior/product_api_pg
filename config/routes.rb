Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :stocks
    end
  end   
end