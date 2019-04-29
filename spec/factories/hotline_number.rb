FactoryBot.define do
  factory :hotline_number do

    phone_number { "+#{Faker::Number.number(11)}" }
    transplant_center
  end
end
