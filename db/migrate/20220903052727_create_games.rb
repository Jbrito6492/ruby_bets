class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :away_team
      t.string :home_team
      t.integer :week
      t.string :winner
      t.datetime :game_time

      t.timestamps
    end
  end
end
