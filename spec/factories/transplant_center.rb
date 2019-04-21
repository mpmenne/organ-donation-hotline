FactoryBot.define do
  factory :transplant_center do
    name { 'Some Hospital' }
    phone_number { "+#{Faker::Number.number(11)}" }
    area_code { Faker::Number.number(3).to_s }
    city { Faker::TvShows::GameOfThrones.city }
    state 'MO'


    trait :barnes do
      name 'Barnes Jewish Hospital'
      city 'Saint Louis'
      area_code '314'
    end

    trait :slu do
      name 'Saint Louis University Hospital'
      city 'Saint Louis'
      area_code '314'
    end

    trait :out_of_state do
      name 'Cedars Sinai Hospital'
      city 'Los Angeles'
      state 'CA'
      area_code '310'
    end
  end
end
