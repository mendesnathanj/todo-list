# frozen_string_literal: true

FactoryBot.define do
  factory :permission do
    association :list
    association :user

    read_access { true }
    write_access { true }
    delete_access { true }

    trait :shared_permission do
      delete_access { false }
    end
  end
end
