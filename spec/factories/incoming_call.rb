FactoryBot.define do
  factory :incoming_call do
    call_sid { Faker::Alphanumeric.rand }
    call_status 'Calling'
    called { "+#{Faker::Number.number(11)}" }
    from { "+#{Faker::Number.number(11)}" }
    from_city { Faker::TvShows::GameOfThrones.city.upcase }
    from_state { 'MO' }
  end
end
