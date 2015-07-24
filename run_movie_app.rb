require_relative 'app/controllers/scheduler_controller.rb'

if ARGV.any?
  FILE = ARGV.first
  scheduler = SchedulerController.new
  scheduler.schedule_movies(FILE)
else
  puts '****Please enter a file with movie information.****'
end
