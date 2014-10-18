# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

RSpec.describe Team, :type => :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
