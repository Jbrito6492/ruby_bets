FactoryBot.define do
  factory :game do
    away_team { Faker::Team.name }
    home_team { Faker::Team.name }
    schedule
  end
end
