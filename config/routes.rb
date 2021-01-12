Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get 'set_status_form',      to: 'pages#set_status_form'
  get 'smoker_profile_definition', to: 'pages#smoker_profile_definition'
  get 'invite_a_friend', to: 'pages#invite_a_friend'
  put 'set_status',          to: 'pages#set_status'
  get 'privacy_policy',       to: 'pages#privacy_policy'
  get 'terms_and_conditions', to: 'pages#terms_and_conditions'
  get 'data_supression',      to: 'pages#data_supression'

end
