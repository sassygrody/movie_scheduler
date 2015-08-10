# stahp
class Theater
  attr_reader :name, :screen_count, :opens_at, :closes_at, :movies

  def initialize(args = {})
    @name = args[:name]
    @screen_count = args[:screen_count]
    @opens_at = args[:opens_at]
    @closes_at = args[:closes_at]
    @movies = []
  end

  def opens_at
    Time.parse(@opens_at)
  end

  def closes_at
    Time.parse(@closes_at)
  end

  def hours_of_operation
    "#{open_in_minutes} to #{close_in_minutes}"
  end

  def open_in_minutes
    "#{opens_at.strftime('%I:%M %p')}"
  end

  def close_in_minutes
    "#{closes_at.strftime('%I:%M %p')}"
  end

  def print_display_name_and_hours
    puts '========================================'
    a = Artii::Base.new # :font => 'slant'
    puts a.asciify("#{name}")
    puts " Hours: #{hours_of_operation}"
    puts "\n"
  end
end
