class SessionAssignment < ApplicationRecord
  belongs_to :enrollment
  belongs_to :camp_occurrence
end
