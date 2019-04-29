FactoryBot.define do

  factory :twilio_incoming_call_request, class: Hash do
    transient do
      phone_number { "+#{Faker::Number.number(11)}" }
    end

    initialize_with do
      json = JSON.parse(File.open(Rails.root.join('spec', 'support', 'fixtures', 'twilio_incoming_call_request.json')).read)
      json["Called"] = phone_number
      json
    end

  end

end
