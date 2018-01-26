class HomeController < ApplicationController
  
  def index
    @players = Player.includes(:team, :positions).all
    @teams = Team.includes(:players).all
    @positions = Position.all
  end
end