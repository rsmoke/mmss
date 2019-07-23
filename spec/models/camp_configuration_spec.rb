require 'rails_helper'

RSpec.describe CampConfiguration, type: :model do
  context "all required fields are present" do
    subject { build(:camp_configuration) } 

    it 'is valid' do
      expect(subject).to be_valid
    end
    
  end

  context "required fields are not blank" do
    it { should validate_presence_of(:camp_year) }
    it { should validate_presence_of(:application_open) }
    it { should validate_presence_of(:application_close) }
    it { should validate_presence_of(:priority) }
    it { should validate_presence_of(:application_materials_due) }
    it { should validate_presence_of(:camper_acceptance_due) }
    
  end
  
end
