Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/my_games', to: 'games#my_games', as: 'my_games'
  resources :games do
    resources :reviews, only: %i[new create]
    resources :reservations, only: %i[new create]
  end
  resources :reservations, only: %i[destroy index]
  resources :reviews, only: :destroy
end
