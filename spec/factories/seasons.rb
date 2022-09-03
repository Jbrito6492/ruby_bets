FactoryBot.define do
  factory :season do
    week { Faker::Number.between(from: 1, to: 17) }
    year { Faker::Number.between(from: Date.current.year, to: Date.current.year + 1) }

    trait :with_games do
      after(:create) do |season|
        create_list(:game, 2, season: season)
      end

      trait :with_teams do
        after(:create) do |season|
          season.games.each do |game|
            create_list(:team, 2, game: game)
          end
        end
      end
    end
  end
end