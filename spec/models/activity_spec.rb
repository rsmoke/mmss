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
require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:cost_cents) }
  it { should validate_presence_of(:date_occurs) }
end
