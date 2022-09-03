require 'rails_helper'

RSpec.describe "seasons/edit", type: :view do
  before(:each) do
    @season = assign(:season, Season.create!(
      week: 1,
      year: 1
    ))
  end

  it "renders the edit season form" do
    render

    assert_select "form[action=?][method=?]", season_path(@season), "post" do

      assert_select "input[name=?]", "season[week]"

      assert_select "input[name=?]", "season[year]"
    end
  end
end
