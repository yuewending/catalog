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

class CoffeeBean < ApplicationRecord
end
