require 'rails_helper'

RSpec.describe "seasons/show", type: :view do
  before(:each) do
    @season = assign(:season, Season.create!(
      week: 2,
      year: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
