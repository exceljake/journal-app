Rails.application.routes.draw do
  root to: "devise/sessions#new"
  devise_for :users
  
  resources :categories do
    resources :tasks
  end
  # root "devise/sessions#new"
end
