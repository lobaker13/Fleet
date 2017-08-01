Rails.application.routes.draw do
  resources :trip_comments
  resources :group_comments
  resources :groups do
    resources :trips do
      resources :itineraries
    end
  end  
  post 'groups/:group_id/trips/:trip_id/itineraries/new' => 'itineraries#new'
  get 'trips/:id/search' => 'trips#search', as: :search
  #get 'trips/:id/newitin' => 'trips#newitin', as: :newitin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '/usersearch' => 'home#usersearch', as: 'user_search'
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
  get 'addtogroup/:user_id/:group_id' => "groups#group_user", as: 'add_group_user'
  get 'removefromgroup/:user_id/:group_id' => "groups#destroy_group_user", as: 'destroy_group_user'
end
