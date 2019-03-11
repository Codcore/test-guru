module QuestionsHelper
  QUESTION_HEADER_ACTIONS = { edit: 'Edit', new: 'Create new'}.freeze

  def question_header(question)
    action = QUESTION_HEADER_ACTIONS[action_name.to_sym]
    "#{action} question for test \"#{question.test.title}\""
  end
end
