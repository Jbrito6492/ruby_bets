require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  before(:each) do
    schedule = FactoryBot.create(:schedule)
    @game = FactoryBot.create(:game, schedule: schedule)
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(@game), "post" do

      assert_select "input[name=?]", "game[away_team]"

      assert_select "input[name=?]", "game[home_team]"

      assert_select "input[name=?]", "game[schedule_id]"
    end
  end
end
