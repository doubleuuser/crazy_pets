Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pets#index'

  resources :pets do
    resources :bookings, only: [ :index, :new, :create ]
  end

  resources :bookings, only: [ :show, :edit, :destroy ]

  get 'users/:id/my_pets', to: 'pets#my_pets', as: 'my_pets'
  get 'users/:id/my_bookings', to: 'bookings#my_bookings', as: 'my_bookings'

end
