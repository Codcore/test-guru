class Test < ApplicationRecord
  has_and_belongs_to_many :users

  def self.all_from_category(category_title)
    category = Category.find_by(title: category_title)
    return nil unless category

    Test.where(category_id: category.id)
  end
end
