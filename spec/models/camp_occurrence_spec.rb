require 'rails_helper'

RSpec.describe CampOccurrence, type: :model do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:begin_date) }
  it { should validate_presence_of(:end_date) }
end
