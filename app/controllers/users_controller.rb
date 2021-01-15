class UsersController < ApplicationController
  before_action :find_user

  def set_status
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
  def profile_update
    average_cigarettes_per_day = params[:user][:average_cigarettes_per_day].to_i
    hour_of_first_smoke        = params[:user][:hour_of_first_smoke].to_i
    raise
  end

  def favorite_cigarette_definition
  end


  def set_status_form
  end

  def smoker_profile_definition
  end

  def invite_a_friend
  end


  private

  def user_params
    params.require(:user).permit(tag_list: [])
  end

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end
end
