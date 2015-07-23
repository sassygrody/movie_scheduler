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

  def assign_movie_start_times(theater)
    start_times << theater.opens_at if start_times.empty?

    # duplicate movies already have start times!

    movie_duration = duration_plus_45_minutes
    last_show_time = theater.closes_at - movie_duration

    until start_times[-1] + movie_duration > last_show_time
      start_times << start_times[-1] + movie_duration
    end
  end
end
