require 'rails_helper'

RSpec.describe IncomingCallFormObject do
  describe '#save' do
    context 'when save is success' do
      it 'returns success' do
        from_number = "+#{Faker::Number.number(11)}"
        FactoryBot.create(:hotline_number, phone_number: from_number)
        twilio_request = FactoryBot.build(:twilio_incoming_call_request, phone_number: from_number)

        result = described_class.new(twilio_request).save

        expect(result).to be_success
      end

      it 'returns twixml to call' do
        from_number = "+#{Faker::Number.number(11)}"
        FactoryBot.create(:hotline_number, phone_number: from_number)
        twilio_request = FactoryBot.build(:twilio_incoming_call_request, phone_number: from_number)

        expect { described_class.new(twilio_request).save }
          .to change(IncomingCall, :count).by 1
      end

      it 'saves everythhing that needs to be saved' do
        time_now = Time.zone.now
        from_number = "+#{Faker::Number.number(11)}"
        FactoryBot.create(:hotline_number, phone_number: from_number)
        twilio_request = FactoryBot.build(:twilio_incoming_call_request, phone_number: from_number)

        described_class.new(twilio_request).save

        incoming_call = IncomingCall.first
        expect(incoming_call.call_sid).to eq twilio_request['CallSid']
        expect(incoming_call.called).to eq twilio_request['Called']
        expect(incoming_call.call_status).to eq twilio_request['CallStatus']
        expect(incoming_call.from).to eq twilio_request['From']
        expect(incoming_call.from_number).to eq twilio_request['FromNumber']
        expect(incoming_call.from_city).to eq 'SAINT LOUIS'
        expect(incoming_call.from_state).to eq 'MO'
        expect(incoming_call.call_time).not_to be_nil
      end

      it 'saves the hotline if exists' do
        from_number = "+#{Faker::Number.number(11)}"
        hotline_number = FactoryBot.create(:hotline_number, phone_number: from_number)
        twilio_request = FactoryBot.build(:twilio_incoming_call_request, phone_number: from_number)

        described_class.new(twilio_request).save

        incoming_call = IncomingCall.first
        expect(incoming_call.hotline_number).to eq hotline_number
      end

      it 'should dial the hotline transplant center' do
        from_number = "+#{Faker::Number.number(11)}"
        center = FactoryBot.build(:transplant_center)
        hotline_number = FactoryBot.create(:hotline_number, phone_number: from_number, transplant_center: center)
        twilio_request = FactoryBot.build(:twilio_incoming_call_request, phone_number: from_number)

        result = described_class.new(twilio_request).save

        expect(result.to_s).to include center.phone_number
      end
    end

    context 'when the call fails' do
      xit 'returns twixml to hang up the call' do
        result = described_class.new.save

        expect(result).to be_success
      end
    end

    private

    def stub_lookup_service
      transplant_center = FactoryBot.build(:transplant_center)
      class_stub = class_double(TransplantCenterLookupService).as_stubbed_const
      allow(class_stub).to receive(:call).with(anything).and_return(transplant_center)
      class_stub
    end
  end
end
