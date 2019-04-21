require 'rails_helper'
require 'dry/monads/result'

RSpec.describe Api::V1::IncomingCallsController, type: :controller do
  describe '#create' do
    context 'uses strong params' do
      before(:each) { stub_form_object(success: true) }
      it { should permit(:Called, :ToState, :CallerCountry, :Direction, :CallerState, :ToZip, :CallSid, :To, :CallerZip, :ToCountry, :ApiVersion, :CalledZip, :CalledCity, :CallStatus, :From, :AccountSid, :CalledCountry, :CallerCity, :Caller, :FromCountry, :ToCity, :FromCity, :CalledState, :FromZip, :FromState).for :create }
    end

    context 'when valid request' do
      it 'returns a 200' do
        stub_form_object(success: true)

        post :create, params: {}

        expect(response).to be_success
      end
    end

    context 'when call fails' do
      it 'returns a 500' do
        form_stub = stub_form_object(success: false)

        post :create, params: {}

        should respond_with 500..600
      end

      it 'should hang up the phone call' do
        form_stub = stub_form_object(success: false)

        post :create, params: {}

        should respond_with 500..600
      end
    end
  end

  def stub_form_object(success:)
    monad = success ? Dry::Monads::Success.new('') : Dry::Monads::Failure.new('')
    responder = ApplicationFormObject::FormObjectResponder::Responder.new(monad)
    form_stub = instance_double(IncomingCallFormObject)
    class_stub = class_double(IncomingCallFormObject).as_stubbed_const
    allow(class_stub).to receive(:new).and_return(form_stub)
    allow(form_stub).to receive(:save).and_yield(responder)
    form_stub
  end
end
