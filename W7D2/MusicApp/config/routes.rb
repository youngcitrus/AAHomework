Rails.application.routes.draw do
  resources :tracks, except: :index
  resources :albums, except: :index
  resources :bands
  resources :users, only: %i(new create show)
  resource :session, only: %i(create destroy new)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
