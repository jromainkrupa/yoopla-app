class UsersController < ApplicationController
  def set_status
    @user = current_user
    choice = params[:user][:user_status]

    if choice == User::STATUS.first
      @user.user_status = choice
      @user.save
      redirect_to smoker_profile_definition_user_path(current_user)

    elsif choice == User::STATUS.second
      @user.user_status = choice
      @user.save
      redirect_to invite_a_friend_user_path(current_user)

    else
      render :set_status_form
    end
  end
end
