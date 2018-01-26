class PositionsController < ApplicationController

  def index
    @positions = Position.all
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)

    if @position.save
      flash[:success] = "Position created!"
      redirect_to @position
    else
      render :new
    end
  end

  def show
    @position = Position.find(params[:id])
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])
    
    if @position.update_attributes(position_params)
      flash[:success] = "Your changes have been updated!"
      redirect_to @position
    else
      render :edit
    end
  end

  def destroy
    @position = Position.find(params[:id]).destroy
    flash[:success] = "Position deleted."
    redirect_to positions_url
  end

  private

  def position_params
    params.require(:position).permit(:name, :description, :code)
  end

end


