Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'chat_rooms#index'
  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'
end
