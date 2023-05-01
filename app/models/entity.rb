# frozen_string_literal: true

class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_or_equal_to: 0 }
end
