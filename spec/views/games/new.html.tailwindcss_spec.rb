require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      away_team: "MyString",
      home_team: "MyString",
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input[name=?]", "game[away_team]"

      assert_select "input[name=?]", "game[home_team]"
    end
  end
end
