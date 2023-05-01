# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'groups#index', as: :authenticated_root
    end
    unauthenticated do
      root to: 'users#splash', as: :unauthenticated_root
    end
  end

  resources :groups, only: %i[index new create] do
    resources :entities, only: %i[index new create] do
    end
  end
end
