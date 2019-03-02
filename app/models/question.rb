class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :max_answers

  private

  def max_answers
    errors.add(:answers) unless (1..4).cover?(answers.count)
  end
end
