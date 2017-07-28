Rails.application.routes.draw do
  resources :trip_comments
  resources :group_comments
  resources :groups do
    resources :trips do
      resources :itineraries
    end
  end
  get 'trips/:id/search' => 'trips#search', as: :search
  get 'trips/:id/newitin' => 'trips#newitin', as: :newitin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
end
