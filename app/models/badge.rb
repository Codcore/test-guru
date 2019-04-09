class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, uniqueness: true
  validates :file_name, presence: true

  def file_url
    File.join('badges_images', file_name)
  end

  def give_away?(test_passage)
    return NotImplementedError
  end

  def self.badges_types
    Dir["#{File.dirname(__FILE__)}/badges/*.rb"].each { |file| load file }
    Badges.constants.select { |c| Badges.const_get(c).is_a? Class }.sort!
  end
end
