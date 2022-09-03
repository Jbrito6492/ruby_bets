require 'rails_helper'

RSpec.describe "seasons/new", type: :view do
  before(:each) do
    assign(:season, Season.new(
      week: 1,
      year: 1
    ))
  end

  it "renders new season form" do
    render

    assert_select "form[action=?][method=?]", seasons_path, "post" do

      assert_select "input[name=?]", "season[week]"

      assert_select "input[name=?]", "season[year]"
    end
  end
end
