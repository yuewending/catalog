# == Schema Information
#
# Table name: coffee_beans
#
#  id         :integer          not null, primary key
#  blend_name :string
#  origin     :string
#  variety    :string
#  notes      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require Rails.root.join("spec", "support", "increasing_random.rb")

FactoryGirl.define do
  factory :coffee_bean do
    sequence(:blend_name) { |n| "Some fake blend name #{n}" }
    sequence(:origin) { |n| "Some fake origin #{n}" }
    sequence(:variety) { |n| "Some fake variety #{n}" }
    sequence(:notes) { |n| "Some fake notes #{n}" }
  end
end
