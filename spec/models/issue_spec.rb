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

require 'spec_helper'

RSpec.describe Issue, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
