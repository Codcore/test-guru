class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :max_answers_number

  scope :correct, -> { where(correct: true) }

  private

  def max_answers_number
    message = 'reached max number of answers'
    errors.add(:question, message: message) unless (1..4).cover?(question.answers.count)
  end
end
