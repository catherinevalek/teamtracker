class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      flash[:success] = "Player created!"
      redirect_to @player
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    
    if @player.update_attributes(player_params)
      flash[:success] = "Your changes have been updated!"
      redirect_to @player
    else
      render :edit
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    flash[:success] = "Player deleted"
    redirect_to :index
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :number, :team)
  end

end


