class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :max_answers_count

  scope :correct, -> { where(correct: true) }

  private

  def max_answers_count
    errors.add(:answer) unless (1..4).cover?(question.answers.count)
  end
end
