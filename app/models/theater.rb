class Theater
  attr_accessor :name, :screen_count, :opens_at, :closes_at, :movies

  def initialize(name, screen_count, opens_at, closes_at)
    @name = name
    @screen_count = screen_count
    @opens_at = opens_at
    @closes_at = closes_at
    @movies = []
  end
end
