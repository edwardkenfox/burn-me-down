# == Schema Information
#
# Table name: velocities
#
#  id          :integer          not null, primary key
#  chart_id    :integer
#  start_count :integer
#  end_count   :integer
#  start_at    :date
#  end_at      :date
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

RSpec.describe Velocity, :type => :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:chart)}
    it { is_expected.to validate_presence_of(:start_count)}
    it { is_expected.to validate_presence_of(:end_count)}
    it { is_expected.to validate_presence_of(:start_at)}
    it { is_expected.to validate_presence_of(:end_at)}
  end
end
