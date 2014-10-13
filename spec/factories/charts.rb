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
#  team_id     :integer          not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chart do
    association :team

    name Faker::Lorem.word + "chart"
  end
end
