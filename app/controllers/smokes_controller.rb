class SmokesController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:id])
    @smoke = Smoke.create(user: @user)
    authorize @smoke
    redirect_to program_dashboard_path(@user,@user.program)
  end

  def destroy
  end
end
