# == Schema Information
#
# Table name: session_assignments
#
#  id                 :bigint           not null, primary key
#  enrollment_id      :bigint           not null
#  camp_occurrence_id :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  offer_status       :string
#
class SessionAssignment < ApplicationRecord
  belongs_to :enrollment
  belongs_to :camp_occurrence

  def description_name
    self.camp_occurrence.description
  end

  def display_name
    self.camp_occurrence
  end
end
