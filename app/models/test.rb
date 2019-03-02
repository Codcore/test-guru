class Test < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy,     -> { where(level: 0..1) }
  scope :middle,   -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }


  def self.from_category(category_title)
    Test.joins(:category)
        .where(categories: { title: category_title })
        .order(title: :desc).pluck(:title)
  end
end
