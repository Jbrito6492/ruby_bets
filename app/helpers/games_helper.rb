module GamesHelper
  def show_svg(team)
    File.open("app/assets/images/#{team.short_name}.svg", 'rb') do |file|
      raw file.read
    end
  end

  def localized_game_time(game)
    game.game_time.localtime.strftime('%A, %B %e, %Y at %l:%M %p')
  end

  def away_team(game)
    game.teams.find_by(name: game.away_team)
  end

  def home_team(game)
    game.teams.find_by(name: game.home_team)
  end

  def started?(game)
    game.game_time <= DateTime.now
  end
end
