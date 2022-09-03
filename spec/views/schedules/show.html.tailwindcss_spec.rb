require 'rails_helper'

RSpec.describe "schedules/show", type: :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
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
