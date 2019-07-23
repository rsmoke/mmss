require 'rails_helper'

RSpec.describe Gender, type: :model do
  it { should validate_presence_of(:name) }
end
