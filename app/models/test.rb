class Test < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category

  def self.all_from_category(category_title)
    Test.joins(:category).where(category: { title: category_title}).order(title: :desc).pluck(:title)
  end
end
