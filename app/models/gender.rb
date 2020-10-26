# == Schema Information
#
# Table name: genders
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Gender < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
