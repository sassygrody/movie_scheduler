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
    assign_first_showtime(movie)

    movie_duration = movie.duration_plus_45_minutes
    last_show_time = closes_at - movie_duration

    until movie.start_times[-1] + movie_duration > last_show_time
      movie.start_times << movie.start_times[-1] + movie_duration
    end
  end

  def assign_first_showtime(movie)
    if movie.start_times.empty?
      movie.start_times << opens_at
    end
  end
end
