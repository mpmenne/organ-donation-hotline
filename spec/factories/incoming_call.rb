FactoryBot.define do
  factory :incoming_call do
    call_sid { Faker::Alphanumeric.rand }
    call_status 'Calling'
    called { "+1#{Faker::Number.number(10)}" }
    from { "+1#{Faker::Number.number(10)}" }
    from_city { Faker::TvShows::GameOfThrones.city.upcase }
    from_state { 'MO' }
    call_time { Faker::Time.backward }
  end
end
