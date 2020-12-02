Rails.application.routes.draw do


  resources :recuploads
  resources :feedbacks
  # resources :payments
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
    resources :activities
  end

  resources :enrollments do
      resources :financial_aids
  end

  resources :financial_aids

  resources :enrollments do
    resources :recommendations
  end

  resources :recommendations

  resources :enrollments do
    resources :course_preferences
  end

  resources :enrollments do
    resources :course_assignments
  end

  resources :enrollments do
    resources :session_assignments
  end

  resources :course_preferences
  resources :course_assignments
  resources :session_assignments
  
  # post 'accept_offer', to: 'enrollments#accept_offer'
  # post 'decline_offer', to: 'enrollments#decline_offer'

  post 'accept_session_offer/:id', to: 'session_assignments#accept_session_offer', as: :accept_session_offer
  post 'decline_session_offer/:id', to: 'session_assignments#decline_session_offer', as: :decline_session_offer

  get 'static_pages/index'
  get 'static_pages/contact'
  get 'static_pages/privacy'


  get 'payments', to: 'payments#index'
  get 'payment_receipt', to: 'payments#payment_receipt'
  post 'payment_receipt', to: 'payments#payment_receipt'
  get 'payment_show', to: 'payments#payment_show', as: 'all_payments'
  get 'make_payment', to: 'payments#make_payment'
  post 'make_payment', to: 'payments#make_payment'

  get 'recupload_error', to: 'recuploads#error'
  get 'recupload_success', to: 'recuploads#success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
