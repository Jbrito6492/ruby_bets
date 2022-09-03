require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      name: "MyString",
      short_name: "MyString",
      game: nil
    ))
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(@team), "post" do

      assert_select "input[name=?]", "team[name]"

      assert_select "input[name=?]", "team[short_name]"

      assert_select "input[name=?]", "team[game_id]"
    end
  end
end
