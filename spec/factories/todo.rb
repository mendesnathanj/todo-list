# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    association :list

    description { Faker::Lorem.sentence(word_count: 5) }
    completed { false }
  end
end
