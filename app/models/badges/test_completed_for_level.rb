module Badges::TestCompletedForLevel < Badge
  def give_away?(test_passage)
    user_tests = test_passage.user.tests.where(level: test_passage.test.level).uniq
    return false unless user_tests.count == Test.where(level: test_passage.test.level).count

  end
end