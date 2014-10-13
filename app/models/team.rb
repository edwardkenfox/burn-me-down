# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  has_many :team_members
  has_many :users, through: :team_members
  has_many :charts
  has_many :issues, through: :charts
  has_many :velocities, through: :charts

  validates_presence_of :name
end
