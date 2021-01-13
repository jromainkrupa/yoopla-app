class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy_policy, :terms_and_conditions, :data_supression]

  def home
    if current_user
      case current_user.user_status
      when "mentor"
        redirect_to invite_a_friend_user_path(current_user)
      when "smoker_setup"
        redirect_to smoker_profile_definition_user_path(current_user)
      end
    end
  end
end
