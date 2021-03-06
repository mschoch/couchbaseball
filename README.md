![Logo](https://raw.github.com/mschoch/couchbaseball/master/doc/couchbaseball_logo.png)
## Couchbaseball

A web application to interact with baseball history using Couchbase Server 2.0 to store and process the data.

### Data

You will need to download data files from: http://www.retrosheet.org/

You will also need to install the Chadwick: Software Tools for Game-Level Baseball Data from: http://chadwick.sourceforge.net/

### Getting Started

1.  Clone this repository
2.  Install Couchbase Server 2.0
3.  Create 2 buckets, one named "cache" and one named "couchbaseball"
4.  Edit config/couchbase.yml to point to your Couchbase server and bucket
5.  Save the CSV data from http://www.retrosheet.org/retroID.htm to files/people/people.csv
6.  Load the people data:

        script/load_people

7.  Download the game log data from http://www.retrosheet.org/gamelogs/index.html for whatever years you're interested in to: files/games/
8.  Load the game data:

        script/load_games

9.  Download the game event data from http://www.retrosheet.org/game.htm for whatever years you're interested in to: files/events/<year>
10.  Run the conversion script for a single year of data:

        script/convert_events_year <year>

11.  This will create new files in that year's events folder with the extension .cw
12.  Load the event files for that year:

        script/load_events_year <year>

13.  Start the server
        rails server
        
### Using

There is no default route for / yet, so try these URLs (or variants thereof)

* Person:
  * http://localhost:3000/people/poseb001
* List Teams:
  * http://localhost:3000/teams
* Team:
  * http://localhost:3000/teams/SFN
* List Season:
  * http://localhost:3000/seasons
* Season:
  * http://localhost:3000/seasons/2011
* Team/Season:
  * http://localhost:3000/team_season/SFN2011
* Individual Game:
  * http://localhost:3000/games/LAN201104030

    
### Screenshots

Player Stats:

![Player](https://raw.github.com/mschoch/couchbaseball/master/doc/people.png)

Game Listing for Team/Season:

![TeamSeason](https://raw.github.com/mschoch/couchbaseball/master/doc/teamseason.png)

Individual Game:

![Game](https://raw.github.com/mschoch/couchbaseball/master/doc/game.png)
