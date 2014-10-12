class Issue < ActiveRecord::Base
  belongs_to :chart

  validates_presence_of [:url, :open]

  scope :active, -> { where(open: 1) }
end
