# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#home'

  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: %i[new create]
  end

  resource :doses, only: %i[destroy]

  # Extra routes
  get 'home', to: 'cocktails#home'
end
