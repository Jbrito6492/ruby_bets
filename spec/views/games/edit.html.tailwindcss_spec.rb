require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  before(:each) do
    season = FactoryBot.create(:season)
    @game = FactoryBot.create(:game, season: season)
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(@game), "post" do

      assert_select "input[name=?]", "game[away_team]"

      assert_select "input[name=?]", "game[home_team]"

      assert_select "input[name=?]", "game[season_id]"
    end
  end
end
