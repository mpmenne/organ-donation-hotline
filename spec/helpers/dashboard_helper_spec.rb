require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  describe '#mask_phone' do
    context 'when showing a phone number' do
      it 'only shows thee zip code' do
        masked = helper.mask_phone('+13144779999')

        expect(masked).to eq '+1314477XXXX'
      end
    end
  end

  describe '#format phone' do
    it 'puts the area code in parenthesis' do
      formatted = helper.format_phone('+13144779999')
      expect(formatted).to eq '(314) 477-9999'
    end
  end

  describe '#format_date' do
    it 'spells stuff out' do
      formatted = helper.format_date(DateTime.new(2001,2,3,4,5,6))
      expect(formatted).to eq 'February 3, 2001'
    end
  end
end
