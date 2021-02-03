class ProgramsController < ApplicationController
  before_action :find_user, only: [:new, :calendar, :create, :tutorial, :dashboard, :get_ready]
  before_action :find_and_authorize_program, only: [:tutorial, :calendar, :get_ready]

  def new
    @program = Program.new
    authorize @program
  end

  def create
    @program      = Program.new(program_params)
    @user.status  = User::STATUS.third
    @user.save
    @program.user = @user

    authorize @program

    if @program.save
      redirect_to program_tutorial_path(@user, @program)
    else
      render :new
    end
  end

  def tutorial
  end

  def calendar
  end

  def dashboard
    @program = Program.find(params[:program_id])
    authorize @program

    if Time.zone.now < @program.program_start
      redirect_to program_get_ready_path(@user,@program)
    else
      @user.status = User::STATUS.fourth
      @user.save
    end
  end

  def get_ready
  end

  private

  def program_params
     params.require(:program).permit(:program_start,:program_end,:init_smoke)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def find_and_authorize_program
    @program = Program.find(params[:program_id])
    authorize @program
  end
end
