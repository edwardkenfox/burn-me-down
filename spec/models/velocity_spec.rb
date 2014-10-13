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

require 'spec_helper'

RSpec.describe Velocity, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
