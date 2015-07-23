require 'spec_helper'

describe 'Movie' do
  let(:movie) { Movie.new('Hitch', '2009', 'PG-13', '1:30') }
  let!(:movieA) { Movie.new('A', '2009', 'PG-13', '1:30') }
  let!(:movieB) { Movie.new('B', '2015', 'G', '2:17') }
  let!(:theater) { Theater.new('Webster', '10', '11:00', '23:00') }
  let!(:movieA_duration_plus_45) { (1 * 60 * 60) + (30 * 60) + (45 * 60) } # => 8100
  let!(:movieB_duration_plus_45) { (2 * 60 * 60) + (17 * 60) + (45 * 60) } # => 10920

  describe '#duration_in_minutes' do
    it 'returns the movie\'s duration in minutes' do
      expect(movie.duration_in_minutes).to eq(90)
    end
  end

  describe '#duration_plus_45_minutes' do
    it 'returns the original duration + 45 minutes (for clean up)' do
      expect(movie.duration_plus_45_minutes).to eq(movieA_duration_plus_45)
    end
  end

  describe '#round_time_up_to_5' do
    it 'returns the start time rounded to nearest 5 minute marker' do
      expect(movieA.round_time_up_to_5(movieA_duration_plus_45)).to eq(8100)
      expect(movieA.round_time_up_to_5(movieB_duration_plus_45)).to eq(10_920)
    end
  end
end
