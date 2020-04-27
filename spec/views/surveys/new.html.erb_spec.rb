require 'rails_helper'

RSpec.describe "surveys/new", type: :view do
  before(:each) do
    assign(:survey, Survey.new(
      :title => "MyString",
      :team => nil
    ))
  end

  it "renders new survey form" do
    render

    assert_select "form[action=?][method=?]", surveys_path, "post" do

      assert_select "input[name=?]", "survey[title]"

      assert_select "input[name=?]", "survey[team_id]"
    end
  end
end
