class SeasonsController < ApplicationController
  def index
    @seasons = Game.by_season_team(:group_level => 1, :include_docs => false).fetch().reverse!
  end

  def show
    @season = params[:id]
    startkey = [ @season ]
    endkey = [@season, {} ]
    @seasonteams = Game.by_season_team(:group_level => 2, :include_docs => false, :startkey => startkey, :endkey => endkey)
  end
end
