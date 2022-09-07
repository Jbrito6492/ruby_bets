# frozen_string_literal: true

module Maintenance
  class ImportGamesTask < MaintenanceTasks::Task
    csv_collection

    def process(row)
      # The work to be done on a row of the CSV
      away_team = Team.find_by(name: row['away_team'])
      home_team = Team.find_by(name: row['home_team'])
      Game.create(week: row['round_number'], away_team: row['away_team'], home_team: row['home_team'], game_time: row['date'], teams: [away_team, home_team])
    end
  end
end
