require 'rails_helper'

RSpec.describe "issues/new", :type => :view do
  before(:each) do
    assign(:issue, Issue.new(
      :url => "MyString",
      :open => 1
    ))
  end

  it "renders new issue form" do
    render

    assert_select "form[action=?][method=?]", issues_path, "post" do

      assert_select "input#issue_url[name=?]", "issue[url]"

      assert_select "input#issue_open[name=?]", "issue[open]"
    end
  end
end
