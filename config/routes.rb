require 'sidekiq/web'

Rails.application.routes.draw do
  resources :notification_all_as_reads, only: [:create]
  resources :notifications, only: [:index]
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users, controllers: { invitations: "users/invitations" }
  root to: 'home#index'
  resources :users, only: [:index] 
  resources :games, only: [:create, :update, :index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
