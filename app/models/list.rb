# frozen_string_literal: true

class List < ApplicationRecord
  validates :title, presence: true

  has_many :permissions
  has_many :users, through: :permissions
  has_many :todos
end
