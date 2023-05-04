# top-level documentation comment
class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, numericality: { only_integer: true, greater_or_equal_to: 0 }
end
