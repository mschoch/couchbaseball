class TeamSeasonController < ApplicationController
  def show
    @teamseason = params[:id]
    @team = @teamseason[0..2]
    @season = @teamseason[3..6]

    startkey = [ @team, @season ]
    endkey = [@team, @season, {} ]
    @games = Game.by_team_date(:reduce => false, :include_docs => false, :startkey => startkey, :endkey => endkey)

  end
end
