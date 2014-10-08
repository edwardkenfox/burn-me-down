require 'rails_helper'

RSpec.describe "issues/show", :type => :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      :url => "Url",
      :open => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/1/)
  end
end
