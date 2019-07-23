require 'rails_helper'

RSpec.describe ApplicantDetail, type: :model do
  context "all required fields are present" do
    subject { build(:applicant_detail) } 

    it 'is valid' do
      expect(subject).to be_valid
    end
    
  end
end
