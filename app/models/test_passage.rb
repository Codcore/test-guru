class TestPassage < ApplicationRecord

  COMPLETION_THRESHOLD = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  # before_create :after_create_set_expire_time

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
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

  def time_left_to_pass
    self.expire_time - Time.now
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def after_create_set_expire_time
    if test.passage_time > 0
      self.expire_time = test.passage_time.minutes.from_now
      puts expire_time
    else
      self.expire_time = nil
    end
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
