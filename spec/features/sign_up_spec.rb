require 'rails_helper'

RSpec.describe 'New people signing up' do
  it 'saves a new signup in the database' do
    visit '/sign_up'

    fill_in 'sign_up_email_address', with: 'g@g.com'

    click_button 'Sign Up'

    expect(page.text).to have_content 'Thank you!'
  end
end
