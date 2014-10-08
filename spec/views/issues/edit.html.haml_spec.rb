require 'rails_helper'

RSpec.describe "issues/edit", :type => :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      :url => "MyString",
      :open => 1
    ))
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(@issue), "post" do

      assert_select "input#issue_url[name=?]", "issue[url]"

      assert_select "input#issue_open[name=?]", "issue[open]"
    end
  end
end
