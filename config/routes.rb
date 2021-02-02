Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  authenticated  :user do
    resources :users, path: "utlisateurs" do
      member do
        get :set_status_form
        put :set_status
        get :smoker_profile_definition
        put :profile_update
        get :smoker_profile_definition_step_2
        get :invite_a_friend

        resources :programs, only: %i[show new create] do
          get :tutorial
          get :get_ready
          get :dashboard
        end
      end
    end
  end
end
