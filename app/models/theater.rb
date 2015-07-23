require 'pry-byebug'
# shut up
class Theater
  attr_accessor :name, :screen_count, :opens_at, :closes_at, :movies

  def initialize(name, screen_count, opens_at, closes_at)
    @name = name
    @screen_count = screen_count
    @opens_at = Time.parse(opens_at)
    @closes_at = Time.parse(closes_at)
    @movies = []
  end

  def opens_at_time
    Time.parse(opens_at)
  end

  def open_in_minutes
    "#{opens_at.hour}:#{opens_at.min}"
  end

  def close_in_minutes
    "#{closes_at.hour}:#{closes_at.min}"
  end
end
