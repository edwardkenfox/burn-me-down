# == Schema Information
#
# Table name: issues
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  open       :integer
#  chart_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Issue < ActiveRecord::Base
  belongs_to :chart

  validates_presence_of [:url, :open]

  # TODO: create module to manage issue open status
  scope :active, -> { where(open: 1) }
end
