require 'rails_helper'

RSpec.describe "schedules/edit", type: :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
      week: 1,
      year: 1
    ))
  end

  it "renders the edit schedule form" do
    render

    assert_select "form[action=?][method=?]", schedule_path(@schedule), "post" do

      assert_select "input[name=?]", "schedule[week]"

      assert_select "input[name=?]", "schedule[year]"
    end
  end
end
