require 'rails_helper'

RSpec.describe 'Index Page' do
  context 'when numbers exist' do
    it 'shows them on the home page' do
      slu = FactoryBot.create(:transplant_center, :slu)
      hotline = FactoryBot.create(:hotline_number, transplant_center: slu)
      call = FactoryBot.create(:incoming_call, hotline_number: hotline)

      visit '/'

      expect(page.text).to have_content('1 Call')
    end
  end
end
