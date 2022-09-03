require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        away_team: "Away Team",
        home_team: "Home Team",
        schedule: nil
      ),
      Game.create!(
        away_team: "Away Team",
        home_team: "Home Team",
        schedule: nil
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", text: "Away Team".to_s, count: 2
    assert_select "tr>td", text: "Home Team".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
