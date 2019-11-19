Rails.application.routes.draw do

  root to: 'static_pages#index'
  
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # authenticated :admin do
    resources :genders
    resources :demographics

    resources :camp_configurations do
      resources :camp_occurrences
    end

    resources :camp_occurrences do
      resources :activities
    end

    resources :camp_occurrences do
      resources :courses
    end

    resources :activities
    resources :courses
  # end
  
  devise_for :users
  resources :applicant_details

  resources :enrollments do 
    resources :travels
  end

  resources :enrollments do 
    resources :financial_aids
  end
  
  resources :enrollments do
    resources :recommendations
  end

  get 'static_pages/index'
  get 'static_pages/contact'
  get 'static_pages/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
