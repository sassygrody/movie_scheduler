require 'time'

# Shut up
class Movie
  attr_accessor :title, :year, :rating, :duration

  def initialize(title, year, rating, duration)
    @title = title
    @year = year
    @rating = rating
    @duration = duration
  end

  def duration_in_minutes(movie)
    duration = Time.parse(movie.duration)
    duration = duration.hour * 60 + duration.min
    duration
  end
end
