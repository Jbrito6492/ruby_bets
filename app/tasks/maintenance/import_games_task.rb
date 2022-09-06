# frozen_string_literal: true

module Maintenance
  class ImportGamesTask < MaintenanceTasks::Task
    csv_collection

    def process(row)
      # The work to be done on a row of the CSV
      Game.create(week: row[:round_number], away_team: row[:away_team], home_team: row[:home_team], game_time: row[:date])
    end
  end
end
