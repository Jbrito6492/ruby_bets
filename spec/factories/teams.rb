FactoryBot.define do
  factory :team do
    name { Faker::Team.name }
    short_name { Faker::Lorem.characters(number: 3) }
  end
end
