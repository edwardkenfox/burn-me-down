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

require 'rails_helper'

RSpec.describe Chart, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
