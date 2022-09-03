class CreateSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :seasons do |t|
      t.integer :week
      t.integer :year

      t.timestamps
    end
  end
end
