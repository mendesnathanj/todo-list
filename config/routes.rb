# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :users do
        resources :lists, shallow: true do
          resources :todos, shallow: true
        end
      end
    end
  end
end
