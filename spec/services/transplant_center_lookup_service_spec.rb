require 'rails_helper'
require 'errors'

RSpec.describe TransplantCenterLookupService do
  describe '.call' do
    context 'when a hospital exists in the area' do
      it 'returns the transplant center' do
        FactoryBot.create(:transplant_center, :out_of_state)
        slu = FactoryBot.create(:transplant_center, :slu)

        result = described_class.call('MO')

        expect(result.phone_number).to eq slu.phone_number
      end
    end

    context 'when a hospital does not exist' do
      it 'sends them to a random hospital' do
        FactoryBot.create(:transplant_center, :out_of_state)
        FactoryBot.create(:transplant_center, :barnes)
        FactoryBot.create(:transplant_center, :slu)

        result = described_class.call('PA')

        expect(result.name).to eq('Barnes Jewish Hospital')
          .or eq('Saint Louis University Hospital')
          .or eq('Cedars Sinai Hospital')
      end
    end

    context 'when multiple hospitals exist in a callers area' do
      it 'returns the transplant center with the fewest referrals' do
        FactoryBot.create(:incoming_call, from_city: 'SAINT LOUIS')
        FactoryBot.create(:transplant_center, :barnes)
        FactoryBot.create(:transplant_center, :slu)

        result = described_class.call('MO')

        expect(result.name).to eq('Barnes Jewish Hospital').or('Saint Louis University Hospital')
      end

    end

    context 'when a call comes in from the California' do
      it 'calls Cedars Sinai' do
        slu = FactoryBot.create(:transplant_center, :slu)
        FactoryBot.create(:transplant_center, :out_of_state)

        result = described_class.call('CA')

        expect(result.name).to eq('Cedars Sinai Hospital')
      end
    end

    context 'when no transplant centers are in the db' do
      it 'raises an error' do
        # no centers
        expect { described_class.call('CA') }.to raise_error(Errors::InvalidStateError)
      end
    end
  end
end
