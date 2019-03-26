require 'octokit'

class GistQuestionService

  END_POINT    = 'https://github.com'
  ACCESS_TOKEN = '8af03777999788b8dab7fb61ed3bb24f5a1c503b'.freeze

  def initialize(question, client: nil)
    @question = question
    @test     = @question.test
    @client   = client || Octokit::Client.new(access_token: ACCESS_TOKEN, end_point: END_POINT)
    @user     = @client.user
    @user.login
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n::translate('.gist_question_service.description', question: @question.body.to_s),
      files: {
        'test-guru-question.txt' => {
          'content': gist_content
        }
      }
    }
  end

  def gist_content
    content  = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
