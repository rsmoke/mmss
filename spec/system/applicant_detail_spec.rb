require 'rails_helper'

RSpec.describe ApplicantDetail do
    describe 'creating a record' do
      context 'with valid fields' do
        it 'succesfully creates a new record' do
            sign_in
            # navigate to applicant_detail form
            visit new_applicant_detail_path
            # enter requered fields data
            fill_in 'First Name', with: 'Rita'
            fill_in 'Last Name', with: 'Barvinok'
            fill_in 'Address1', with: '123 Main St'
            fill_in 'City', with: 'Ann Arbor'
            select 'Michigan', from: 'State'
            fill_in 'Postal Code', with: '48103'
            select 'France', from: 'Country'
            fill_in 'Phone', with: '7345556789'
            select '2001', from:'Year'
            select 'June', from: 'Month'
            select '1', from: 'Day'
            fill_in 'Parent/Guardian Full Name', with: 'My Mom'
            fill_in 'Parent/Guardian Phone', with: '7348765678'
            fill_in 'Parent/Guardian eMail', with: 'mom@test.com'
            # select 2, from: 'Gender'
            # 'US Citizen'
            # click submit
            click_on 'Register'
            # check for a new record in the database
            expect(page).to have_content('Applicant Detail was successfully created.')
        end
      end
  
    #   context 'when id is not present' do
    #     it 'returns a new appointment instance' do
    #     end
    #   end
    end
end