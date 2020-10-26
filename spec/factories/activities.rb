# == Schema Information
#
# Table name: activities
#
#  id                 :bigint           not null, primary key
#  camp_occurrence_id :bigint           not null
#  description        :string           not null
#  cost_cents         :string           not null
#  date_occurs        :date             not null
#  active             :boolean          default(FALSE), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :activity do
    session { nil }
    description { "MyString" }
    cost_cents { 20000 }
    date_occurs { "2019-07-23" }
    active { false }
  end
end
