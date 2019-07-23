class CampConfiguration < ApplicationRecord
  has_many :camp_sessions, dependent: :destroy

  validates :camp_year, presence: true
  validates :application_open, presence: true
  validates :application_close, presence: true
  validates :priority, presence: true
  validates :application_materials_due, presence: true
  validates :camper_acceptance_due, presence: true
end
