class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, uniqueness: true
  validates :file_name, presence: true

  def file_url
    File.join('badges_images', file_name)
  end
end
