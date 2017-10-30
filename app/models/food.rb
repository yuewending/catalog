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

class Food < ApplicationRecord
end
