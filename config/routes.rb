Antinote::Application.routes.draw do

  resources :sessions
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  resources :notes do
    member do
    end
  end

  resources :categories
  
  namespace :api do
    resources :notes, :defaults => { :format => 'json' }
    resources :categories, :defaults => { :format => 'json' }
    get "home/error"
  end
  get "home/dashboard"
  get "home/preview"
  get "home/setup"
  post "home/create"
  root 'home#dashboard'

end
