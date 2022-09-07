module GamesHelper
  def show_svg(team)
    File.open("app/assets/images/#{team.short_name}.svg", "rb") do |file|
      raw file.read
    end
  end
end
