class Badges::FirstPassedTestBadge < Badge
  def give_away?(test_passage)
    passed_tests = 0
    test_passage.user.test_passages.where(test_id: test_passage.test.id).each do |t_p|
      passed_tests += 1 if t_p.succeed?
      break if passed_tests >= 2
    end
    passed_tests == 1 && test_passage.succeed?
  end
end
