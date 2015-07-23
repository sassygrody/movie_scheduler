require_relative 'movie'
require_relative 'theater'
require 'csv'
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
        theater.add_movie(movie_from_row) if theater.name == row[2]
      end
    else
      puts 'Something went wrong.'
    end
  end

  print_theater_with_movie_show_times(list_of_theaters)
end

def print_theater_with_movie_show_times(theaters)
  theaters.each do |theater|
    puts '===='
    puts theater.name
    puts "--Hours of operation #{theater.format_open_hour_with_minutes} to #{theater.format_close_hour_with_minutes}"
    puts "--Theater has #{theater.screen_count} screens"
    puts "--Theater has #{theater.movies.count} movies"
    puts '===='
    puts "\n"

    theater.movies.each do |movie|
      theater.assign_movie_start_times(movie)
      puts "#{movie.title} - #{movie.duration_in_minutes} minutes"
      movie.start_times.each do |time|
        puts "#{time.hour}:#{time.min}"
      end
    end
  end
end
