require_relative '../models/movie'
require_relative '../models/theater'
require_relative '../models/color'
require 'csv'
require 'pp'
require 'artii'

# stahp
class SchedulerController
  def schedule_movies(file)
    @list_of_theaters = []
    @list_of_movies = []

    CSV.foreach(file) do |row| # order of input in CSV is important!
      parse_theater_info(row) if row[0] == 'Open'
      parse_movie_info(row) if row[0] == 'Book'
      assign_movies_to_theaters(row, @list_of_theaters) if row[0] == 'Show'
    end
    print_theater_name_and_showtimes(@list_of_theaters)
  end

  def parse_theater_info(row)
    @theater = Theater.new(name: row[1], screen_count: row[2], opens_at: row[3], closes_at: row[4])
    @list_of_theaters << @theater
  end

  def parse_movie_info(row)
    @movie = Movie.new(title: row[1], year: row[2], rating: row[3], duration: row[4])
    @list_of_movies << @movie
  end

  def assign_movies_to_theaters(row, theaters)
    theaters.each do |theater|
      if theater.name == row[2]
        movie_object = @list_of_movies.detect { |movie| movie.title == row[1] }
        new_movie_object = Movie.new(title: movie_object.title, year: movie_object.year, rating: movie_object.rating, duration: movie_object.duration, theater: theater)
        theater.movies << new_movie_object
      end
    end
  end

  def print_theater_name_and_showtimes(theaters)
    theaters.sort_by(&:name).each do |theater|
      theater.print_display_name_and_hours
      theater.movies.each(&:print_movie_schedule)
    end
  end
end
