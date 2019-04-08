class Badge < ApplicationRecord
  has_many :users

  validates :name, uniqueness: true
  validates :file_name, presence: true
end
