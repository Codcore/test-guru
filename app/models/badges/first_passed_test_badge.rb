module Badges
  class FirstPassedTestBadge < Badge
    def give_away?(test_passage)
      test_passage.user.test_passages.where(test_id: test_passage.test.id).count == 0 && test_passage.succeed?
    end
  end
end