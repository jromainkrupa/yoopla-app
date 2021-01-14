Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :users do
    member do
      get 'set_status_form'
      put 'set_status'
      get 'smoker_profile_definition'
      put 'profile_update'
      get 'favorite_cigarette_definition'
      get 'invite_a_friend'
    end
  end


  get 'privacy_policy',       to: 'pages#privacy_policy'
  get 'terms_and_conditions', to: 'pages#terms_and_conditions'
  get 'data_supression',      to: 'pages#data_supression'

end
