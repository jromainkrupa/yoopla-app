class ProgramsController < ApplicationController
  def new
    @program = Program.new
    @user = User.find(params[:id])
    authorize @program
  end

  def create
    @program = Program.new(program_params)
    @user = User.find(params[:id])
    @program.user = @user

    authorize @program

    if @program.save
      redirect_to program_tutorial_path(@user, @program)
    else
      render :new
    end
  end

  def tutorial
    @program = Program.find(params[:program_id])
    @user = User.find(params[:id])

    authorize @program
  end

  def show
    @program = Program.find(params[:id])
    authorize @program

  end

  private

  def program_params
     params.require(:program).permit(:start,:end,:init_smoke)
  end


end
