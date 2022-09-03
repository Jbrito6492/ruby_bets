FactoryBot.define do
  factory :schedule do
    week { Faker::Number.between(from: 1, to: 17) }
    year { Faker::Number.between(from: Date.current.year, to: Date.current.year + 1) }

    trait :with_games do
      after(:create) do |schedule|
        create_list(:game, 2, schedule: schedule)
      end

      trait :with_teams do
        after(:create) do |schedule|
          schedule.games.each do |game|
            create_list(:team, 2, game: game)
          end
        end
      end
    end
  end
end