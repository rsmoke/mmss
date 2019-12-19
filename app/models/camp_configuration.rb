class CampConfiguration < ApplicationRecord
  has_many :camp_occurrences, dependent: :destroy

  validates :camp_year, presence: true, uniqueness: true
  validates :application_open, presence: true
  validates :application_close, presence: true
  validates :priority, presence: true
  validates :application_materials_due, presence: true
  validates :camper_acceptance_due, presence: true

  scope :active, -> { where(active: true) }

  scope :active_camp_year, -> { where(active: true).pick(:camp_year) }

  def display_name
    self.camp_year # or whatever column you want
  end
end
