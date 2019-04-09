class TestPassage < ApplicationRecord

  COMPLETION_THRESHOLD = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    validate!

    if completed?
      self.passed = succeed?
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def success_percent
    (100 / test.questions.count) * correct_questions
  end

  def succeed_or_failed
    if success_percent >= COMPLETION_THRESHOLD
      :succeed
    else
      :failed
    end
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def succeed?
    success_percent >= COMPLETION_THRESHOLD && completed?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    answer_ids.reject!(&:empty?)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first if current_question
  end
end
