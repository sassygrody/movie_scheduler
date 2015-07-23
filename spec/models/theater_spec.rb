require 'spec_helper'

describe 'Theater' do
  let!(:movieA) { Movie.new('A', '2009', 'PG-13', '1:30') }
  let!(:movieB) { Movie.new('B', '2015', 'G', '2:17') }
  let!(:movieC) { Movie.new('C', '2000', 'R', '1:45') }
  let!(:theater) { Theater.new('Webster', '10', '11:00', '23:00') }
  let!(:theater) { Theater.new('City North', '3', '10:00', '23:00') }
  let!(:movieA_duration_plus_45) { (1 * 60 * 60) + (30 * 60) + (45 * 60) } # => 8100
  let!(:movieB_duration_plus_45) { (2 * 60 * 60) + (17 * 60) + (45 * 60) } # => 10920

  before do
    theater.add_movie(movieA)
  end

  describe '#add_movie' do
    it 'adds the movie to the theaters list' do
      theater.add_movie(movieB)
      expect(theater.movies).to match_array([movieA, movieB])
    end
  end

  describe '#assign_movie_start_times' do
    before do
      theater.assign_movie_start_times(movieA)
    end

    it 'sets the first start time to the open time of theater' do
      expect(movieA.start_times.first).to eq(theater.opens_at)
    end

    it 'adds the movie duration + 45 minutes to find the next start time' do
      expect(movieA.start_times[1]).to eq(theater.opens_at + movieA_duration_plus_45)
    end

    it 'stops adding start times when last showing is after the theater closes' do
      last_movie_show_time = theater.closes_at - movieA_duration_plus_45
      expect(movieA.start_times[-1]).to be < last_movie_show_time
    end
  end

  describe '#movie_duration_plus_45_minutes' do
    it 'returns the original duration + 45 minutes (for clean up)' do
      expect(theater.movie_duration_plus_45_minutes(movieA.duration)).to eq(movieA_duration_plus_45)
    end
  end

  describe '#round_time_to_nearest_5' do
    it 'returns the start time rounded to nearest 5 minute marker' do
      expect(theater.round_time_to_nearest_5(movieA_duration_plus_45)).to eq(8100)
      expect(theater.round_time_to_nearest_5(movieB_duration_plus_45)).to eq(10_920)
    end
  end
end
