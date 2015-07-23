require_relative 'app/models/scheduler.rb'

if ARGV.any?
  FILE = ARGV.first
  schedule_movies(FILE)
else
  puts '****Please enter a file with movie information.****'
end
