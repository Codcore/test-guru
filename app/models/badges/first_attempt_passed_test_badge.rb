class Badges::FirstAttemptPassedTestBadge < Badge
  def give_away?(test_passage)
    test_passages = test_passage.user.test_passages.where(test_id: test_passage.test.id)
    test_passages.count == 1 && test_passages.first.succeed?
  end
end