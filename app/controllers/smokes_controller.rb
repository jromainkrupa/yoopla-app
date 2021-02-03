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
    @user = current_user
    @smoke = Smoke.last

    if @smoke.nil?
      render :program_dashboard
    else
      @smoke.destroy

      authorize @smoke
      redirect_to program_dashboard_path(@user,@user.program)
    end
  end
end
