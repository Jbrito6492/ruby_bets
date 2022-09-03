require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    @game = assign(:game, FactoryBot.create(:game))
    @team = assign(:team, FactoryBot.create(:team, game: @game))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@team.name}/)
    expect(rendered).to match(/#{@team.short_name}/)
  end
end
