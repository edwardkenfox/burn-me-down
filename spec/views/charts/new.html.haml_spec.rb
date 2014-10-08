require 'rails_helper'

RSpec.describe "charts/new", :type => :view do
  before(:each) do
    assign(:chart, Chart.new(
      :name => "MyString"
    ))
  end

  it "renders new chart form" do
    render

    assert_select "form[action=?][method=?]", charts_path, "post" do

      assert_select "input#chart_name[name=?]", "chart[name]"
    end
  end
end
