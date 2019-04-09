class Badges::TestCompletedForLevel < Badge
  def give_away?(test_passage)
    user_tests_for_level = test_passage.user.completed_tests.where(level: test_passage.test.level)
    all_test_for_level = Test.where(level: test_passage.test.level)

    (user_tests_for_level.count == all_test_for_level.count) && TestPassage.where(test: test_passage.test, passed: true).count == 1
  end
end