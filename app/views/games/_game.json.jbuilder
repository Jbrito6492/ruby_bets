json.extract! game, :id, :away_team, :home_team, :gametime, :schedule_id, :created_at, :updated_at
json.url game_url(game, format: :json)
