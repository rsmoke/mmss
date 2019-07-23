Rails.application.routes.draw do
  resources :sessions
  resources :genders
  resources :demographics
  resources :applicant_details
  resources :camp_configurations
  devise_for :users
  root to: 'static_pages#index'
  get 'static_pages/index'
  get 'static_pages/contact'
  get 'static_pages/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
