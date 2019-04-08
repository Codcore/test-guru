class Badge < ApplicationRecord
  has_many :users

  validates :name, uniqueness: true
  validates :file_name, presence: true

  def file_url
    File.join(Rails.root, 'public/badges_images', file_name)
  end
end
