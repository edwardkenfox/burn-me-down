require 'rails_helper'

RSpec.describe "charts/index", :type => :view do
  before(:each) do
    assign(:charts, [
      Chart.create!(
        :name => "Name"
      ),
      Chart.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of charts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
