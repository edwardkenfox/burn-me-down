# == Schema Information
#
# Table name: issues
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  open       :integer
#  chart_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

RSpec.describe Issue, :type => :model do
  let(:issue) { create(:issue) }
  let(:closed_issue) { create(:issue, open: 2) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:open) }
  end

  describe "scope :active" do
    subject { Issue.active }

    it { is_expected.to include issue }
    it { is_expected.not_to include closed_issue }
  end
end
