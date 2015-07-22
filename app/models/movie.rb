require 'time'

# Shut up
class Movie
  attr_accessor :title, :year, :rating, :duration, :start_times

  def initialize(title, year, rating, duration)
    @title = title
    @year = year
    @rating = rating
    @duration = duration
    @start_times = []
  end

  def duration_in_minutes
    duration = Time.parse(self.duration)
    duration = duration.hour * 60 + duration.min
    duration
  end

  def is_playing_in?(theater)
    theater.movies.include?(self)
  end
end
