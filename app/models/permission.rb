# frozen_string_literal: true

class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :list
end
