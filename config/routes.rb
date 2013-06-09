Antinote::Application.routes.draw do

  resources :sessions
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  resources :notes do
    member do
      post "share"
    end
  end

  resources :categories

  get 'share/:uuid' => 'shares#show'
  get 's/:uuid' => 'shares#show'
  post 'share/:note_id' => 'shares#create'
  namespace :api do
    resources :notes, :defaults => { :format => 'json' }
    resources :categories, :defaults => { :format => 'json' }
    get "home/error"
  end

  get "home/dashboard"
  get "home/preview"
  get "home/setup"
  get "home/share"
  post "home/create"

  root 'home#dashboard'

end
