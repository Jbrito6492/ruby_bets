require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      FactoryBot.create(:team),
      FactoryBot.create(:team)
    ])
  end

  it "renders a list of teams" do
    render
    expect(rendered).to have_rendered(partial: "_team", count: 2)
  end
end
