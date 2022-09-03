require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    season = FactoryBot.create(:season)
    assign(:games, [
      FactoryBot.create(:game, season: season, away_team: "Away Team"),
      FactoryBot.create(:game, season: season, home_team: "Home Team")
    ])
  end

  it "renders a list of games" do
    render
    expect(rendered).to match(/Away Team/)
    expect(rendered).to match(/Home Team/)
  end

  it "renders _game partial for each game" do
    render
    expect(view).to render_template(partial: "_game", count: 2)
  end
end
