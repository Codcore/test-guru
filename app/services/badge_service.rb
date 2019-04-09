class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @badges = Badge.all
  end

  def call
    new_badges = []
    @badges.each do |badge|
      if badge.give_away?(@test_passage)
        @test_passage.user.badges << badge
        new_badges << badge
      end
    end
    new_badges
  end
end