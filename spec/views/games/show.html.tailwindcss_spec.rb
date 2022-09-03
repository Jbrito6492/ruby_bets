require 'rails_helper'

RSpec.describe "games/show", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      away_team: "Away Team",
      home_team: "Home Team",
      schedule: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Away Team/)
    expect(rendered).to match(/Home Team/)
    expect(rendered).to match(//)
  end
end
