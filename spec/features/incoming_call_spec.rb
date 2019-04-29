require 'rails_helper'


RSpec.describe 'Twilio Incoming Call API', type: :feature do
  it 'connects to another number' do
    from_number = "+#{Faker::Number.number(11)}"
    to_number = "+#{Faker::Number.number(11)}"
    called_number = "+#{Faker::Number.number(11)}"
    slu = FactoryBot.create(:transplant_center, :slu, phone_number: to_number)
    FactoryBot.create(:hotline_number, phone_number: called_number, transplant_center: slu)

    @call = ttt_call('api/v1/incoming_calls', from_number, to_number, caller_state: 'MO', called: called_number)

    expect(@call).to have_say('Thank you for considering organ donation.  Now connecting you to Saint Louis University Hospital')
    expect(@call).to have_dial(to_number)
  end

  it 'connects to the number associated with the hotline' do
    from_number = "+#{Faker::Number.number(11)}"
    to_number = "+#{Faker::Number.number(11)}"
    called_number = "+#{Faker::Number.number(11)}"
    FactoryBot.create(:transplant_center, :slu)
    barnes = FactoryBot.create(:transplant_center, :barnes, phone_number: to_number)
    FactoryBot.create(:hotline_number, phone_number: called_number, transplant_center: barnes)

    @call = ttt_call('api/v1/incoming_calls', from_number, to_number, caller_state: 'MO', called: called_number)

    expect(@call).to have_say('Thank you for considering organ donation.  Now connecting you to Barnes Jewish Hospital')
    expect(@call).to have_dial(to_number)
  end
end

