class User < ApplicationRecord
  has_and_belongs_to_many :tests

  validates :email, presence: true

  scope :tests_for_level, ->(level) { tests.where(level: level) }
end
