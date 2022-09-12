class Game < ApplicationRecord
  has_and_belongs_to_many :teams

  def self.calculate_current_week
    week_one_end_date = Date.new(2022, 9, 13)
    today = Date.today
    days_since_week_one = (today - week_one_end_date).to_i
    (days_since_week_one / 7) + 2
  end

  def self.get_current_games
    week = calculate_current_week
    get_games(week)
  end

  def self.get_next_games
    week = calculate_current_week + 1
    get_games(week)
  end

  def self.get_previous_games
    week = calculate_current_week - 1
    get_games(week)
  end

  def self.get_games(week)
    Game.where(week: week)
  end
end
