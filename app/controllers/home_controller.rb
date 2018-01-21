class HomeController < ApplicationController
  
  def index
    @players = Player.all
    @teams = Team.all
    @positions = Position.all
  end
end