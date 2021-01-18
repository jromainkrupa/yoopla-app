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

    else
      render :new
    end
  end


end
