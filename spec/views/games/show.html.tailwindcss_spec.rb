require 'rails_helper'

RSpec.describe "games/show", type: :view do
  before(:each) do
    season = FactoryBot.create(:season)
    @game = assign(:game, FactoryBot.create(:game, season: season))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@game.away_team}/)
    expect(rendered).to match(/#{@game.home_team}/)
  end
end
