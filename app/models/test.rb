class Test < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.all_from_category(category_title)
    Test.joins(:category).where(category: { title: category_title }).order(title: :desc).pluck(:title)
  end
end
