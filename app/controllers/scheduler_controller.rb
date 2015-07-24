require_relative '../models/movie'
require_relative '../models/theater'
require 'csv'
require 'pp'

class SchedulerController
  def schedule_movies(file)
    @list_of_theaters = []
    @list_of_movies = []

    # order of inputs in CSV are important
    CSV.foreach(file) do |row|
      if row[0] == 'Open'
        parse_theater_info(row)
      elsif row[0] == 'Book'
        parse_movie_info(row)
      elsif row[0] == 'Show'
        assign_movies_to_theaters(row)
      end
    end
    print_theater_with_movie_show_times(@list_of_theaters)
  end

  def parse_theater_info(row)
    @theater = Theater.new(row[1], row[2], row[3], row[4])
    @list_of_theaters << @theater
  end

  def parse_movie_info(row)
    @movie = Movie.new(row[1], row[2], row[3], row[4])
    @list_of_movies << @movie
  end

  def assign_movies_to_theaters(row)
    @list_of_theaters.each do |theater|
      movie_object = @list_of_movies.detect { |movie| movie.title == row[1] }
      new_movie_object = Movie.new(movie_object.title, movie_object.year, movie_object.rating, movie_object.duration)
      theater.movies << new_movie_object if theater.name == row[2]
    end
  end

  def print_theater_with_movie_show_times(theaters)
    theaters.each do |theater|
      puts '========================================'
      puts theater.name
      puts "- Hours: #{theater.hours_of_operation}"
      puts '========================================'
      puts "\n"

      print_movie_schedule(theater)
    end
  end

  def print_movie_schedule(theater)
    theater.movies.each do |movie|
      movie.assign_movie_start_times(theater) # pass theater for hours

      puts "#{movie.title} - #{movie.duration_in_minutes} minutes"
      movie.start_times.map do |time|
        puts " #{time.hour}:#{time.min}"
      end
      puts "\n"
    end
  end
end
