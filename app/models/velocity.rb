class Velocity < ActiveRecord::Base
  belongs_to :chart
  validates_presence_of [:chart, :start_count, :end_count, :start_at, :end_at]
end
