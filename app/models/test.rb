class Test < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :questions, dependent: :destroy
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }

  scope :easy,     -> { where(level: 0..1) }
  scope :middle,   -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }
  scope :from_category, lambda { |category_title|
                          joins(:category)
                            .where(categories: { title: category_title })
                        }

  def self.titles_from_category(category_title)
    from_category(category_title).order(title: :desc).pluck(:title)
  end
end
