require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  context "all required fields are present" do
    subject { build(:enrollment) } 

    it 'is valid' do
      expect(subject).to be_valid
    end
    
  end
end
