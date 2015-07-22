require 'spec_helper'

describe 'Movie' do
  let(:movie) { Movie.new('Hitch', '2009', 'PG-13', '1:30') }

  describe '#duration_in_minutes' do
    it 'returns the movie\'s duration in minutes' do
      expect(movie.duration_in_minutes).to eq(90)
    end
  end
end
