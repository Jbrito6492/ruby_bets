json.extract! game, :id, :away_team, :home_team, :game_time, :created_at, :updated_at
json.url game_url(game, format: :json)
