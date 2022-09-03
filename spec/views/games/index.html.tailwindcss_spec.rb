require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    @away_team = Faker::Team.name
    @home_team = Faker::Team.name
    schedule = FactoryBot.create(:schedule)
    assign(:games, [
      FactoryBot.create(:game, schedule: schedule, away_team: @away_team),
      FactoryBot.create(:game, schedule: schedule, home_team: @home_team)
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", text: @away_team.to_s, count: 2
    assert_select "tr>td", text: @home_team.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
