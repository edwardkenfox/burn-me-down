# == Schema Information
#
# Table name: team_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class TeamUser < ActiveRecord::Base
  belongs_to :team
  belongs_to :user

  validates_presence_of [:team, :user]
end
