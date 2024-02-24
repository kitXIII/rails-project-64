# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, only: %i[show new create] do
    scope module: :posts do
      resources :comments, only: :create
    end
  end

  devise_for :users
end
