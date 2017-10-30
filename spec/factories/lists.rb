# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Copy this file into your spec/support folder; create one if you don't have it.
# https://github.com/firstdraft/increasing_random/blob/master/increasing_random.rb

require Rails.root.join("spec", "support", "increasing_random.rb")

FactoryGirl.define do
  factory :list do
    sequence(:title) { |n| "Some fake title #{n}" }
    sequence(:description) { |n| "Some fake description #{n}" }
  end
end
