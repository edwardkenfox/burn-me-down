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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :velocity do
  end
end
