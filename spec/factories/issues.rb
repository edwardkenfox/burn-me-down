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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    url "MyString"
    open 1
  end
end
