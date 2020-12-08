require 'rails_helper'

RSpec.describe Gender do
    describe 'creating a record' do
      context 'with valid fields' do
        it 'succesfully creates a new record' do
          admin_sign_in
            fill_in 'Name', with: 'Female'
            fill_in 'Description', with: 'Not male'
            click_on 'Create Gender'
            # check for a new record in the database
            expect(page).to have_content('Gender was successfully created.')
        end
      end
  
    #   context 'when id is not present' do
    #     it 'returns a new appointment instance' do
    #     end
    #   end
    end
end