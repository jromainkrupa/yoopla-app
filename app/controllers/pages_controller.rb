class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy_policy, :terms_and_conditions, :data_supression]

  def home
    if current_user
      case current_user.status
      when "mentor"
        redirect_to invite_a_friend_path(current_user)
      when "smoker_setup"
        redirect_to smoker_profile_definition_path(current_user)
      when "ready_to_start"
        redirect_to program_dashboard_path(current_user,current_user.program)
      end
    end
  end
end
