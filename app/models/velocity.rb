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

class Velocity < ActiveRecord::Base
  belongs_to :chart
  validates_presence_of [:chart, :start_count, :end_count, :start_at, :end_at]
end
