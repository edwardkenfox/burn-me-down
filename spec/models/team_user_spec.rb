# == Schema Information
#
# Table name: team_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

RSpec.describe TeamUser, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
