# == Schema Information
#
# Table name: financial_aids
#
#  id            :bigint           not null, primary key
#  enrollment_id :bigint           not null
#  amount_cents  :integer
#  source        :string
#  awarded       :boolean          default(FALSE)
#  note          :text
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :financial_aid do
    enrollment { nil }
    amount_cents { 1 }
    source { "MyString" }
    awarded { false }
    note { "MyText" }
    status { "MyString" }
  end
end
