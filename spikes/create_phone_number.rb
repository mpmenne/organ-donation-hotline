require_relative 'common_spike'
require_relative 'twilio_client_with_logging'
require 'faraday'
require 'faraday/detailed_logger'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end


client = Twilio::REST::Client.new(nil, nil, nil, nil,TwilioClientWithLogging.new)

phone_number =  client.api.available_phone_numbers('US').toll_free.list.first.phone_number

response = client.incoming_phone_numbers.create(friendly_name: 'Phone Number for John', phone_number: phone_number, voice_url: 'https://justtakesonecall.com/api/v1/incoming_calls')

puts 'all done'
