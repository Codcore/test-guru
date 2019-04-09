class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @badges = Badge.all
  end

  def call
    @badges.each do |badge|
      @test_passage.user.badges.push(badge) if badge.give_away?(@test_passage)
    end
  end
end