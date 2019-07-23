require 'rails_helper'

RSpec.describe Activity, type: :model do
  # is_expected.to monetize(:cost_in_cents)
  it { should validate_presence_of(:description) }
  # it { should validate_presence_of(:cost_in_cents) }
  it { should validate_numericality_of(:cost_in_cents) }
  it { should validate_presence_of(:date_occurs) }
end
