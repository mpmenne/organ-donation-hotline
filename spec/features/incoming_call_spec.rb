require 'rails_helper'


RSpec.describe 'Twilio Incoming Call API', type: :feature do
  it 'connects to another number' do
    FactoryBot.create(:transplant_center, :slu)
    from_number = "+#{Faker::Number.number(11)}"
    to_number = "+#{Faker::Number.number(11)}"
    @call = ttt_call('api/v1/incoming_calls', from_number, to_number, caller_state: 'MO')

    expect(@call).to have_say('Thank you for considering organ donation.  Now connecting you to St. Louis University Hospital')
    expect(@call).to have_dial(to_number)
  end
end

