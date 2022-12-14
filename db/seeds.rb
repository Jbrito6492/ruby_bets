# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

teams = [{ name: "Arizona Cardinals", short_name: "ARI" },
         { name: "Atlanta Falcons", short_name: "ATL" },
         { name: "Baltimore Ravens", short_name: "BAL" },
         { name: "Buffalo Bills", short_name: "BUF" },
         { name: "Carolina Panthers", short_name: "CAR" },
         { name: "Chicago Bears", short_name: "CHI" },
         { name: "Cincinnati Bengals", short_name: "CIN" },
         { name: "Cleveland Browns", short_name: "CLE" },
         { name: "Dallas Cowboys", short_name: "DAL" },
         { name: "Denver Broncos", short_name: "DEN" },
         { name: "Detroit Lions", short_name: "DET" },
         { name: "Green Bay Packers", short_name: "GB" },
         { name: "Houston Texans", short_name: "HOU" },
         { name: "Indianapolis Colts", short_name: "IND" },
         { name: "Jacksonville Jaguars", short_name: "JAX" },
         { name: "Kansas City Chiefs", short_name: "KC" },
         { name: "Los Angeles Chargers", short_name: "LAC" },
         { name: "Los Angeles Rams", short_name: "LAR" },
         { name: "Miami Dolphins", short_name: "MIA" },
         { name: "Minnesota Vikings", short_name: "MIN" },
         { name: "New England Patriots", short_name: "NE" },
         { name: "New Orleans Saints", short_name: "NO" },
         { name: "New York Giants", short_name: "NYG" },
         { name: "New York Jets", short_name: "NYJ" },
         { name: "Las Vegas Raiders", short_name: "LV" },
         { name: "Philadelphia Eagles", short_name: "PHI" },
         { name: "Pittsburgh Steelers", short_name: "PIT" },
         { name: "San Francisco 49ers", short_name: "SF" },
         { name: "Seattle Seahawks", short_name: "SEA" },
         { name: "Tampa Bay Buccaneers", short_name: "TB" },
         { name: "Tennessee Titans", short_name: "TEN" },
         { name: "Washington Commanders", short_name: "WAS" }]

teams.each { |team| Team.find_or_create_by!(team) }

nfl_client = Clients::SportsIo::Nfl.new
nfl_client.games.each do |game|
  away_team = Team.find_by(short_name: game[:AwayTeam])
  home_team = Team.find_by(short_name: game[:HomeTeam])
  if away_team && home_team
    game = Game.find_or_create_by!(away_team: away_team.name, home_team: home_team.name, week: game[:Week], game_time: game[:DateTime])
    game.teams = [away_team, home_team]
  end
end

