Rails.application.routes.draw do
  get '/', to: 'events#index',  as: 'root'
  get 'static_pages/secret'
  devise_for :users
  resources :attendances
  resources :events
  resources :users
end
