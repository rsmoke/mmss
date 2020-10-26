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
FactoryBot.define do
  factory :travel do
    enrollment { nil }
    direction { "MyString" }
    transport_needed { "MyString" }
    date { "2019-09-24 16:54:31" }
    mode { "MyString" }
    carrier { "MyString" }
    route_num { "MyString" }
    note { "MyText" }
  end
end
