class TeamsController < ApplicationController

  def index
    @teams = Team.includes(:players).all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      flash[:success] = "Team created!"
      redirect_to @team
    else
      render :new
    end
  end

  def show
    @team = Team.includes(:players).find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    
    if @team.update_attributes(team_params)
      flash[:success] = "Your changes have been updated!"
      redirect_to @team
    else
      render :edit
    end
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team deleted."
    redirect_to teams_url
  end

  private

  def team_params
    params.require(:team).permit(:city, :nickname, :colors, :email, :logo)
  end

end


