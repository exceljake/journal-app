Rails.application.routes.draw do
  # namespace :devise do
    devise_for :user
  # end
  # root "devise/sessions#new"
  # devise_for :users
  # root "devise/sessions#new"
  resources :categories do
    resources :tasks
  end
  root "categories#index"

end
