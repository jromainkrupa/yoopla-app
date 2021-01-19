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
    raise
    if @program.save

    else
      render :new
    end
  end

  private

  def program_params
     params.require(:program).permit(:program_start,:program_end)
  end
end
