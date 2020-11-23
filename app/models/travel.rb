# == Schema Information
#
# Table name: travels
#
#  id               :bigint           not null, primary key
#  enrollment_id    :bigint           not null
#  direction        :string
#  transport_needed :string
#  date             :datetime
#  mode             :string
#  carrier          :string
#  route_num        :string
#  note             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Travel < ApplicationRecord
  belongs_to :enrollment
end
