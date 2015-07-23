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

  def duration_plus_45_minutes
    split_duration_time = duration.split(':')
    hour = split_duration_time[0].to_i
    min = split_duration_time[1].to_i
    movie_duration = (hour * 60 * 60) + (min * 60) + (45 * 60)

    round_time_up_to_5(movie_duration)
  end

  def round_time_up_to_5(duration)
    if duration % 5 == 0
      duration
    else
      down = duration - (duration % (5 * 60))
      down + (5 * 60)
    end
  end
end
