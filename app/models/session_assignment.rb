class SessionAssignment < ApplicationRecord
  belongs_to :enrollment
  belongs_to :camp_occurrence

  def description_name
    self.camp_occurrence.description
  end
end
