require 'rails_helper'

RSpec.describe "issues/index", :type => :view do
  before(:each) do
    assign(:issues, [
      Issue.create!(
        :url => "Url",
        :open => 1
      ),
      Issue.create!(
        :url => "Url",
        :open => 1
      )
    ])
  end

  it "renders a list of issues" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
