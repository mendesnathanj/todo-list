# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :list

  validates :description, presence: true
end
