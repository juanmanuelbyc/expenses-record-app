# frozen_string_literal: true

class Group < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :entities

  validates :name, presence: true, length: { maximum: 50 }
end
