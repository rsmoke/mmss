# == Schema Information
#
# Table name: rejections
#
#  id            :bigint           not null, primary key
#  enrollment_id :bigint           not null
#  reason        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Rejection < ApplicationRecord
  belongs_to :enrollment

  validates :reason, presence: true
end
