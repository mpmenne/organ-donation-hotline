require 'rails_helper'

RSpec.describe 'Call Dashboard', type: :feature do
  it 'shows the phone number of the hotline' do
    hotline_number = FactoryBot.create(:hotline_number, phone_number: '+3143339988')

    visit "/dashboard/#{hotline_number.phone_number.sub!('+', '')}"

    expect(page.text).to have_content('(314) 333-9988')
  end

  it 'shows the connecting transplant center' do
    FactoryBot.create(:hotline_number)
    FactoryBot.create(:hotline_number)
    hotline_number = FactoryBot.create(:hotline_number, phone_number: '+3143339988')

    visit "/dashboard/#{hotline_number.phone_number.sub!('+', '')}"

    expect(page.text).to have_content('(314) 333-9988')
    expect(page.text).to have_content(hotline_number.transplant_center.name)
  end

  it 'should show all of the incoming calls' do
    hotline_number = FactoryBot.create(:hotline_number)
    call1 = FactoryBot.create(:incoming_call, called: hotline_number.phone_number, hotline_number: hotline_number, from: '+3143339988')
    call2 = FactoryBot.create(:incoming_call, called: hotline_number.phone_number, hotline_number: hotline_number, from: '+3144339988')
    call3 = FactoryBot.create(:incoming_call, called: hotline_number.phone_number, hotline_number: hotline_number, from: '+3145339988')

    visit "/dashboard/#{hotline_number.phone_number.sub!('+', '')}"

    expect(page.text).to have_content('(314) 333-XXXX')
    expect(page.text).to have_content('(314) 433-XXXX')
    expect(page.text).to have_content('(314) 533-XXXX')
  end

  it 'shows calls only for the dashboard number' do
    hotline_number = FactoryBot.create(:hotline_number)
    call1 = FactoryBot.create(:incoming_call, called: hotline_number.phone_number, from: '+3143339988')
    call3 = FactoryBot.create(:incoming_call, called: hotline_number.phone_number, hotline_number: hotline_number, from: '+3144339988')

    visit "/dashboard/#{hotline_number.phone_number.sub!('+', '')}"

    expect(page.text).not_to have_content('(314) 333-XXXX')
    expect(page.text).to have_content('(314) 433-XXXX')
  end

  it 'shows what time the call took place' do
    hotline_number = FactoryBot.create(:hotline_number)
    call1 = FactoryBot.create(:incoming_call, called: hotline_number.phone_number, call_time: DateTime.new(2019, 02, 03), hotline_number: hotline_number)

    visit "/dashboard/#{hotline_number.phone_number.sub!('+', '')}"

    expect(page.text).to have_content('February 3, 2019')
  end

  def mask(phone_number)
    phone_number.sub(phone_number.last(4), 'XXXX')
  end
end
