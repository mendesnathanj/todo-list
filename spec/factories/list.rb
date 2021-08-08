# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    title { Faker::Movie.title }
  end
end
