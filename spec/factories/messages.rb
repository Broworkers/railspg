# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    created_at 1.minute.ago
    scope 'ooc'

    trait :sent do
      sent Time.now
    end

    trait :dm do
      name 'Dungeon Master'
      classes %w[ dm ]
      body 'you are dead'
    end

    trait :player do
      name 'Conan'
      classes %w[ say ]
      body 'I hate goblins!'
    end
  end
end
