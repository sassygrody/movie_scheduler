require_relative 'app/models/scheduler.rb'
require 'pry'

if ARGV.any?
  FILE = ARGV.first
  puts "file to read #{FILE}"
  schedule_movies(FILE)
else
  puts '****Please enter a file with movie information.****'
end
