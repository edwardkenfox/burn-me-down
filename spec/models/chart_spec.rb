# == Schema Information
#
# Table name: charts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  velocity_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  team_id     :integer          not null
#

require 'spec_helper'

RSpec.describe Chart, :type => :model do
  let(:team) { create(:team) }
  let(:user) { create(:user) }
  let!(:team_user) { create(:team_user, team: team, user: user) }
  let!(:chart) { create(:chart, team: team) }

  let(:other_team_chart) { create(:chart, team: create(:team)) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "scope :readable_by" do
    subject { Chart.readable_by(user) }

    it { is_expected.to     include chart }
    it { is_expected.not_to include other_team_chart }
  end
end
