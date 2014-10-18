# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

RSpec.describe User, :type => :model do
  let(:user) { create(:user) }

  describe "#setup_team" do
    it "creates Team" do
      expect{
        user.setup_team
      }.to change(Team, :count).by 1
    end

    it "creates TeamUser with user" do
      expect{
        user.setup_team
      }.to change(TeamUser.where(user: user), :count).by 1
    end
  end
end
