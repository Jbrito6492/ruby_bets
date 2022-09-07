require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    @team_1 = FactoryBot.create(:team)
    @team_2 = FactoryBot.create(:team)
    @team_3 = FactoryBot.create(:team)
    @team_4 = FactoryBot.create(:team)
    assign(:games, [
      FactoryBot.create(:game, away_team: @team_1.name, home_team: @team_2.name, teams: [@team_1, @team_2]),
      FactoryBot.create(:game, home_team: @team_3.name, away_team: @team_4.name, teams: [@team_3, @team_4])
    ])
  end

  it "renders a list of games" do
    allow(view).to receive(:show_svg)

    render
    expect(rendered).to match(/#{@team_1.name}/)
    expect(rendered).to match(/#{@team_3.name}/)
  end

  it "renders _game partial for each game" do
    allow(view).to receive(:show_svg)

    render
    expect(view).to render_template(partial: "_game", count: 2)
  end
end
