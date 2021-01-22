class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  private

  def after_sign_in_path_for(resource)
    if current_user.status == nil
      set_status_form_user_path(current_user)
    elsif current_user.status == "smoker_setup"
      smoker_profile_definition_user_path(current_user)
    elsif current_user.status == "ready_to_start"
      program_get_ready_path(current_user,current_user.program)
    elsif current_user.status == "in_program"
      program_dashboard_path(current_user,current_user.program)
    elsif current_user.is_mentor?
      invite_a_friend_user_path(current_user)
    else
      super
    end
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_status])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
