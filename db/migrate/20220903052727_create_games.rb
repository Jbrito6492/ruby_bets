class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :away_team
      t.string :home_team
      t.datetime :game_time
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
