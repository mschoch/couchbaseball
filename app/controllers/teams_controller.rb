class TeamsController < ApplicationController
  
  def index
    lastyear = "2010"
    endkey = [lastyear, {}]
    @currentTeams = Game.by_season_team(:group_level => 2, :include_docs => false, :descending => true, :endkey => endkey).fetch().reverse!
    @teams = Game.by_team_date(:group_level => 1, :include_docs => false)
  end
  
  def show
    @team = params[:id]
    startkey = [ @team ]
    endkey = [@team, {} ]
    @teamseasons = Game.by_team_date(:group_level => 2, :include_docs => false, :startkey => startkey, :endkey => endkey).fetch().reverse!
  end
end
