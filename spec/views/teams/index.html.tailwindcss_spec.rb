require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        name: "Name",
        short_name: "Short Name",
        game: nil
      ),
      Team.create!(
        name: "Name",
        short_name: "Short Name",
        game: nil
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Short Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
