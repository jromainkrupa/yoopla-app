class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy_policy, :terms_and_conditions, :data_supression]

  def set_status
    @user = current_user

    @user.user_status = params[:user][:user_status]
    if @user.save
      redirect_to smoker_profile_definition_path(current_user)
    else
      render :set_status_form
    end
  end
end
