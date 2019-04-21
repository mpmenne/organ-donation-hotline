class IncomingCallFormObject
  include ApplicationFormObject

  def initialize(call)
    @call = call
  end

  def save
    call = IncomingCall.create(call_attributes)
    transplant_center = TransplantCenterLookupService.call(call.from_state)
    response = Twilio::TwiML::VoiceResponse.new
    response.say message: 'Thank you for considering organ donation.  Now connecting you to St. Louis University Hospital', voice: 'alice'
    response.dial(number: transplant_center.phone_number)
    Success(response)
  end

  private

  def call_attributes
    {
      call_sid: @call['CallSid'],
      called: @call['Called'],
      call_status: @call['CallStatus'],
      from: @call['From'],
      from_city: @call['FromCity'],
      from_state: @call['FromState']
    }
  end
end
