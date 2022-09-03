require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    @game = assign(:game, FactoryBot.create(:game))
    assign(:teams, [
      FactoryBot.create(:team, game: @game),
      FactoryBot.create(:team, game: @game)
    ])
  end

  it "renders a list of teams" do
    render
    expect(rendered).to have_rendered(partial: "_team", count: 2)
  end
end
