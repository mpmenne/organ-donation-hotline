FactoryBot.define do

  factory :twilio_incoming_call_request, class: Hash do
    transient do

    end

    initialize_with do
      json = JSON.parse(File.open(Rails.root.join('spec', 'support', 'fixtures', 'twilio_incoming_call_request.json')).read)
      json
    end

  end

end
