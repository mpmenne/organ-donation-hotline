class IncomingCallFormObject
  include ApplicationFormObject

  def initialize(call)
    @call = call
  end

  def save
    if IncomingCall.create(call_attributes)
      hotline = lookup_hotline_number(@call['Called'])
      response = Twilio::TwiML::VoiceResponse.new
      response.say message: "Thank you for considering organ donation.  Now connecting you to #{hotline.transplant_center.name}", voice: 'alice'
      response.dial(number: hotline.transplant_center.phone_number)
      Success(response)
    else

    end
  end

  private

  def call_attributes
    {
      call_sid: @call['CallSid'],
      called: @call['Called'],
      call_status: @call['CallStatus'],
      from: @call['From'],
      from_city: @call['CallerCity'],
      from_state: @call['CallerState'],
      call_time: Time.zone.now,
      hotline_number: lookup_hotline_number(@call['Called'])
    }
  end

  def lookup_hotline_number(called_number)
    HotlineNumber.find_by(phone_number: called_number)
  end
end
