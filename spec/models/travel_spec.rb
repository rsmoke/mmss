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
require 'rails_helper'

RSpec.describe Travel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
