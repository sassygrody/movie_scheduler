require 'spec_helper'

describe 'Theater' do
  let(:movieA) { Movie.new('A', '2009', 'PG-13', '1:30') }
  let(:movieB) { Movie.new('B', '2015', 'G', '2:00') }
  let(:movieC) { Movie.new('C', '2000', 'R', '1:45') }
  let(:theater) { Theater.new('Webster', '10', '11:00', '23:00') }

  describe '#add_movie' do
    it 'adds the movie to the theaters list' do
      theater.add_movie(movieB)
      expect(theater.movies).to include(movieB)
    end
  end
end
