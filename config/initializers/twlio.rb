require 'twilio_client_with_logging'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

Twilio.configure do |config|
  config.account_sid = @account_sid
  config.auth_token = @auth_token
end

@twilio_client = Twilio::REST::Client.new(nil, nil, nil, nil,TwilioClientWithLogging.new)
