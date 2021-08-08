# frozen_string_literal: true

class List < ApplicationRecord
  validates :title, presence: true
end
