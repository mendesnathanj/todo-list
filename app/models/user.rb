# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :permissions
  has_many :lists, through: :permissions
  has_many :todos, through: :lists
end
