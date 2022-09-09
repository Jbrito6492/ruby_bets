FactoryBot.define do
  factory :game do
    away_team { Faker::Team.name }
    home_team { Faker::Team.name }
    game_time { Faker::Time.between(from: DateTime.now - 7.days, to: DateTime.now + 3.weeks) }
  end
end
