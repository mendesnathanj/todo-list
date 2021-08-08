# frozen_string_literal: true

FactoryBot.define do
  factory :lists_user do
    association :list
    association :user

    read_access { true }
    write_access { true }
    delete_access { true }

    trait :shared_lists_user do
      write_access { false }
      delete_access { false }
    end
  end
end
