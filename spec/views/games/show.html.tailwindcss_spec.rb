require 'rails_helper'

RSpec.describe "games/show", type: :view do
  before(:each) do
    @game = assign(:game, FactoryBot.create(:game))
  end

  it "renders attributes in <p>" do
    allow(view).to receive(:show_svg)

    render
    expect(rendered).to match(/#{@game.away_team}/)
    expect(rendered).to match(/#{@game.home_team}/)
  end
end
