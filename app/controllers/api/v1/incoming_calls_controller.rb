# frozen_string_literal: true

require 'twilio-ruby'

module Api
  module V1
    class IncomingCallsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        IncomingCallFormObject.new(call_params).save do |result|
          result.success do |twixml|
            render xml: twixml
          end
          result.failure do |twixml|
            render xml: twixml, status: 500
          end
        end
      end

      private

      def call_params
        params.permit(:Called, :ToState, :CallerCountry, :Direction, :CallerState, :ToZip, :CallSid, :To, :CallerZip, :ToCountry, :ApiVersion, :CalledZip, :CalledCity, :CallStatus, :From, :AccountSid, :CalledCountry, :CallerCity, :Caller, :FromCountry, :ToCity, :FromCity, :CalledState, :FromZip, :FromState)
      end
    end
  end
end
