Rails.application.routes.draw do
  resources :trip_comments
  resources :group_comments
  resources :groups do
    resources :trips do
      resources :itineraries
    end
  end
  get 'trips/:id/search' => 'trips#search', as: :search
  #get 'trips/:id/newitin' => 'trips#newitin', as: :newitin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '/:username' => 'home#profile', as: :profile
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  get 'addfriend/:user_id/:current_user_id' => "home#add_friend", as: 'add_friend'
  get 'acceptfriend/:user_id/:current_user_id' => "home#accept_friend", as: 'accept_friend'
  get 'declinefriend/:user_id/:current_user_id' => "home#decline_friend", as: 'decline_friend'
  get 'removefriend/:user_id/:current_user_id' => "home#remove_friend", as: 'remove_friend'
  get 'blockfriend/:user_id/:current_user_id' => "home#block_friend", as: 'block_friend'
  get 'unblockfriend/:user_id/:current_user_id' => "home#unblock_friend", as: 'unblock_friend'
end
