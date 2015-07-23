require 'spec_helper'

describe 'Scheduler' do
  let!(:movieA) { Movie.new('A', '2009', 'PG-13', '1:30') }
  let!(:movieB) { Movie.new('B', '2015', 'G', '2:17') }
  let!(:theater) { Theater.new('Webster', '10', '11:00', '23:00') }
  let!(:theater2) { Theater.new('City North', '6', '10:00', '22:00') }

  let(:book_row) { ['Book', 'MovieA', '1998', 'R', '2:15'] }
  let(:open_row) { ['Open', 'City North', '5', '13:15', '23:00'] }
  let(:show_row) { ['Show', 'A', 'Webster'] }

  describe '#schedule_movies' do
    xit 'parses the CSV file' do
    end
  end

  describe '#parse_theater_info' do
  end

  describe '#parse_movie_info' do
  end

  describe '#assign_movies_to_theaters' do
    xit 'creates new movie objects' do
    end

    xit 'adds new object to theaters collection' do
      expect(theater.movies).to include(movieA)
    end
  end
end
