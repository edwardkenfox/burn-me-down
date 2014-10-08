require 'rails_helper'

RSpec.describe "charts/show", :type => :view do
  before(:each) do
    @chart = assign(:chart, Chart.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
