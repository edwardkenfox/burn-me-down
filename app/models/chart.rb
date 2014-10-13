# == Schema Information
#
# Table name: charts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  issue_id    :integer
#  velocity_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  team_id     :integer          not null
#

class Chart < ActiveRecord::Base
  belongs_to :team
  has_many :issues
  has_one :velocity

  validates_presence_of :name

  scope :readable_by, -> (user) do
    where(team_id: user.teams.pluck(:id))
  end
end
