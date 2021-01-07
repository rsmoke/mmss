# == Schema Information
#
# Table name: campnotes
#
#  id         :bigint           not null, primary key
#  note       :string
#  opendate   :datetime
#  closedate  :datetime
#  notetype   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :campnote do
    note { "MyString" }
    opendate { "2021-01-06 10:46:40" }
    closedate { "2021-01-06 10:46:40" }
    notetype { "MyString" }
  end
end
