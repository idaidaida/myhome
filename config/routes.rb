Rails.application.routes.draw do
  root to: "commons#index"
  resources :accounts,only:[:new,:create]
  resources :logins, only:[:new,:create] do
    delete :destroy, on: :collection
  end
  resources :households, only:[:index,:create,:show,:edit,:update,:destroy]
  resources :dashboards, only:[:index]
  resources :configs, only:[:index]
  resources :payoffs, only:[:index] do
    patch :update, on: :collection
  end

  namespace :configs do
    namespace :accounts do
      patch "baseinfos", to: "baseinfos#update"
      patch "secureinfos", to: "secureinfos#update"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
