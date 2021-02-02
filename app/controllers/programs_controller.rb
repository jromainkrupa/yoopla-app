class ProgramsController < ApplicationController
  before_action :find_user, only: [:new, :create, :tutorial, :dashboard, :get_ready]
  before_action :find_and_authorize_program, only: [:tutorial, :get_ready]

  def new
    @program = Program.new
    authorize @program
  end

  def create
    @program = Program.new(program_params)
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

  def show
    @program = Program.find(params[:id])
    @user = current_user
    @user.save!
    authorize @program
  end

  def dashboard
    @program = Program.find(params[:program_id])
    @user = current_user
    @user.save!
    authorize @program
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
