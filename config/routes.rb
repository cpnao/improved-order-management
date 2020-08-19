Rails.application.routes.draw do
  devise_for :users

  root to: 'orders#index'
  namespace :customers do
    resources :searches, only: :index, defaults: { format: :json }
  end
  resources :customers

  namespace :order_management do
    resources :undefined_date, only: :index
    resources :undefined_factory, only: :index
    resources :change_delivery_date, only: :index
  end

  namespace :representative do
    resources :backlog, only: :index
    resources :wip, only: :index
    resources :done, only: :index
    resources :today, only: :index
  end

  namespace :accounting do
    resources :backlog, only: :index
    resources :deadline, only: :index
  end

  namespace :domestic_buying do
    resources :backlog, only: :index
    resources :done, only: :index
    resources :sorting, only: :index
  end

  namespace :overseas_buying do
    resources :backlog, only: :index
    resources :done, only: :index
    resources :sorting, only: :index
  end

  namespace :toda1 do
    resources :all, only: :index
    resources :silkscreen_a, only: :index
    resources :inkjet, only: :index
    resources :embroidery, only: :index
    resources :sewing, only: :index
  end

  namespace :bijogi do
    resources :all, only: :index
    resources :silkscreen_a, only: :index
    resources :silkscreen_b, only: :index
    resources :silkscreen_d, only: :index
    resources :uv, only: :index
  end

  namespace :yoyogi do
    resources :silkscreen_d, only: :index
  end

  resources :orders do
    resources :calendar, only: :index
    member do
      patch 'update_representative_user'
    end
  end

  resources :payments
end