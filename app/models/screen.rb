#
class Screen
  attr_accessor :showtimes, :movie

  def initialize(movie)
    @movie = movie
    @showtimes = []
  end
end

# def create_screens_for_theaters(theaters)
#   # theathers.each do |theater|
#   #   theater.movies.each do |movie|
#   #     5.times do
#   #       theater.screens << Screen.new(movie)
#   #     end
#   #   end
#   #   theater
#   # end
# end
