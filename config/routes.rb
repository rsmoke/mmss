Rails.application.routes.draw do
  devise_for :admins
  authenticated :admin do
    resources :genders
    resources :demographics

    resources :camp_configurations do
      resources :camp_sessions do
        resources :activities
      end
    end
  end

  resources :applicant_details
  devise_for :users
  root to: 'static_pages#index'
  get 'static_pages/index'
  get 'static_pages/contact'
  get 'static_pages/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
