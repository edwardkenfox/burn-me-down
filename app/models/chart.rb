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
#

class Chart < ActiveRecord::Base
  has_many :issues
  has_one :velocity

  validates_presence_of :name
end
