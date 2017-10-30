# == Schema Information
#
# Table name: foods
#
#  id            :integer          not null, primary key
#  ingredient    :string
#  spice         :string
#  measurement   :string
#  store_address :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require Rails.root.join("spec", "support", "increasing_random.rb")

FactoryGirl.define do
  factory :food do
    sequence(:ingredient) { |n| "Some fake ingredient #{n}" }
    sequence(:spice) { |n| "Some fake spice #{n}" }
    sequence(:measurement) { |n| "Some fake measurement #{n}" }
    store_address "2461 N Lincoln Ave, Chicago, IL 60614"
  end
end
