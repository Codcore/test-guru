module TestPassagesHelper
  def success_message
    if @test_passage.success_percent >= 85
      :succeed
    else
      :failed
    end
  end
end
