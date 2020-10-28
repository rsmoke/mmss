# == Schema Information
#
# Table name: camp_configurations
#
#  id                        :bigint           not null, primary key
#  camp_year                 :integer          not null
#  application_open          :date             not null
#  application_close         :date             not null
#  priority                  :date             not null
#  application_materials_due :date             not null
#  camper_acceptance_due     :date             not null
#  active                    :boolean          default(FALSE), not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  offer_letter              :text
#
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
  scope :active_camp_materials_due_date, -> { where(active: true).pick(:application_materials_due) }

  def display_name
    self.camp_year # or whatever column you want
  end
end
