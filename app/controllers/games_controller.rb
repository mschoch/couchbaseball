class GamesController < ApplicationController
  
  def index
    
  end
  
  def show
    @game = Game.find("game_" + params[:id])
  end
  
end
