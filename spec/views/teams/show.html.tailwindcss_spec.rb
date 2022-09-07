require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    @team = assign(:team, FactoryBot.create(:team))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@team.name}/)
    expect(rendered).to match(/#{@team.short_name}/)
  end
end