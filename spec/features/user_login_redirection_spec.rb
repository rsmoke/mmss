require 'rails_helper'

RSpec.describe 'User logs in', type: :feature, js: true do

  scenario 'valid inputs' do
    sign_in
    expect(page).to have_content('Signed in successfully.')
    # binding.pry
  end

end