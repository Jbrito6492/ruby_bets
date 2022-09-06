class CreateGamesTeamsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :games, :teams do |t|
      t.index [:game_id, :team_id]
      t.index [:team_id, :game_id]
    end
  end
end
