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

  def add_movie(movie)
    movies << movie
  end

  def format_open_hour_with_minutes
    "#{opens_at.hour}:#{opens_at.min}"
  end

  def format_close_hour_with_minutes
    "#{closes_at.hour}:#{closes_at.min}"
  end

  def assign_movie_start_times(movie)
    if movie.start_times.empty?
      movie.start_times << opens_at
    end

    movie_duration = movie_duration_plus_45_minutes(movie.duration)
    last_show_time = closes_at - movie_duration

    until movie.start_times[-1] + movie_duration > last_show_time
      movie.start_times << movie.start_times[-1] + movie_duration
    end
  end

  def movie_duration_plus_45_minutes(duration)
    split_duration_time = duration.split(':')
    hour = split_duration_time[0].to_i
    min = split_duration_time[1].to_i
    movie_duration = (hour * 60 * 60) + (min * 60) + (45 * 60)

    round_time_to_nearest_5(movie_duration)
  end

  def round_time_to_nearest_5(duration)
    if duration % 5 == 0
      duration
    else
      down = duration - (duration % (5 * 60))
      down + (5 * 60)
    end
  end
end
