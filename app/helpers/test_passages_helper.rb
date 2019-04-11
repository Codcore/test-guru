module TestPassagesHelper
  def seconds_to_time(seconds)
    [(seconds / 3600).floor, (seconds / 60 % 60).floor, (seconds % 60).floor].map { |t| t.to_s.rjust(2,'0') }.join(':')
  end
end
