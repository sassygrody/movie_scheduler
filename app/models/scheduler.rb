require_relative 'movie'
require_relative 'theater'
require 'csv'
require 'pry'
require 'pp'

def schedule_movies(file)
  list_of_theaters = []
  list_of_movies = []

  CSV.foreach(file, headers: false) do |row|
    if row[0] == 'Open'
      @theater = Theater.new(row[1], row[2], row[3], row[4])
      list_of_theaters << @theater
    elsif row[0] == 'Book'
      @movie = Movie.new(row[1], row[2], row[3], row[4])
      list_of_movies << @movie
    elsif row[0] == 'Show'
      list_of_theaters.each do |theater|
        movie_from_row = list_of_movies.detect { |movie| movie.title == row[1] }
        assign_movie_to_theater(movie_from_row, theater) if theater.name == row[2]
      end
    else
      puts 'Something went wrong.'
    end
  end

  print_theaters_with_movies(list_of_theaters)
end

def assign_movie_to_theater(movie, theater)
  theater.movies << movie
end

def print_theaters_with_movies(theaters)
  theaters.each do |theater|
    puts "====="
    puts theater.name
    puts "====="
    theater.movies.each do |movie|
      puts "#{movie.title} - #{movie.duration_in_minutes(movie)} minutes"
    end
    puts "\n"
  end
end
