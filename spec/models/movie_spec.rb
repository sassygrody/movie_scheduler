require 'spec_helper'

describe 'Movie' do
  let!(:movieA) { Movie.new('A', '2009', 'PG-13', '1:30') }
  let!(:movieB) { Movie.new('B', '2015', 'G', '2:17') }
  let!(:movieC) { Movie.new('C', '2000', 'R', '1:45') }
  let!(:theater) { Theater.new('Webster', '10', '11:00', '23:00') }
  let!(:theater2) { Theater.new('City North', '6', '10:00', '22:00') }
  let!(:theater3) { Theater.new('Regal', '15', '12:00', '23:00') }
  let!(:movieA_duration_plus_45) { (1 * 60 * 60) + (30 * 60) + (45 * 60) } # => 8100
  let!(:movieB_duration_plus_45) { (2 * 60 * 60) + (17 * 60) + (45 * 60) } # => 10920

  describe '#duration_in_minutes' do
    it 'returns the movie\'s duration in minutes' do
      expect(movieA.duration_in_minutes).to eq(90)
    end
  end

  describe '#duration_plus_45_minutes' do
    it 'returns the original duration + 45 minutes (for clean up)' do
      expect(movieA.duration_plus_45_minutes).to eq(movieA_duration_plus_45)
    end
  end

  describe '#round_time_up_to_5' do
    it 'returns the start time rounded to nearest 5 minute marker' do
      expect(movieA.round_time_up_to_5(movieA_duration_plus_45)).to eq(8100)
      expect(movieA.round_time_up_to_5(movieB_duration_plus_45)).to eq(10_920)
    end
  end

  describe '#assign_movie_start_times' do
    before do
      movieA.assign_movie_start_times(theater)
      movieB.assign_movie_start_times(theater2)
      movieC.assign_movie_start_times(theater3)
    end

    it 'sets the first start time to the open time of theater' do
      expect(movieA.start_times.first).to eq(theater.opens_at)
      expect(movieB.start_times.first).to eq(theater2.opens_at)
      expect(movieC.start_times.first).to eq(theater3.opens_at)
    end

    it 'adds the movie duration + 45 minutes to find the next start time' do
      expect(movieA.start_times[1]).to eq(theater.opens_at + movieA_duration_plus_45)
    end

    it 'stops adding start times when last showing is after the theater closes' do
      last_movie_show_time = theater.closes_at - movieA_duration_plus_45
      expect(movieA.start_times[-1]).to be < last_movie_show_time
    end
  end
end
