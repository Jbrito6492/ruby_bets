require 'rails_helper'

RSpec.describe "seasons/index", type: :view do
  before(:each) do
    assign(:seasons, [
      FactoryBot.create(:season),
      FactoryBot.create(:season)
    ])
  end

  it "renders a list of seasons" do
    render
    expect(rendered).to have_rendered(partial: "_season", count: 2)
  end
end
