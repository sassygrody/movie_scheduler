require 'time'

# Shut up
class Movie
  attr_accessor :title, :year, :rating, :duration, :start_times

  def initialize(args = {})
    args.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
    @start_times = []
  end

  def duration_in_minutes
    duration = Time.parse(self.duration)
    duration = duration.hour * 60 + duration.min
    duration
  end

  def assign_movie_start_times(theater)
    assign_first_showing(theater)

    movie_duration = duration_plus_45_minutes
    last_show_time = theater.closes_at - movie_duration

    until start_times[-1] + movie_duration > last_show_time
      start_times << round_up(start_times[-1] + movie_duration)
    end
  end

  def assign_first_showing(theater)
    start_times << theater.opens_at if start_times.empty?
    round_up(start_times.first)
  end

  def duration_plus_45_minutes
    split_duration_time = duration.split(':')
    hour = split_duration_time[0].to_i
    min = split_duration_time[1].to_i
    (hour * 60 * 60) + (min * 60) + (45 * 60)
  end

  def round_up(start_time)
    if start_time.min == 0
      start_time
    else
      Time.at((start_time.to_i / 300.0).ceil * 300)
    end
  end
end
