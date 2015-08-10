require 'spec_helper'

describe 'Movie' do
  let!(:movieA) { Movie.new(title: 'A', year: '2009', rating: 'PG-13', duration: '1:30', theater: theater) }
  let!(:movieB) { Movie.new(title: 'B', year: '2015', rating: 'G', duration: '2:17', theater: theater2) }
  let!(:movieC) { Movie.new(title: 'C', year: '2000', rating: 'R', duration: '1:45', theater: theater3) }
  let!(:theater) { Theater.new(name: 'Webster',screen_count: '10', opens_at: '11:00', closes_at: '23:00') }
  let!(:theater2) { Theater.new(name: 'City North',screen_count: '6', opens_at: '10:00', closes_at: '22:00') }
  let!(:theater3) { Theater.new(name: 'Regal', screen_count:'15', opens_at: '12:00', closes_at: '23:00') }
  let!(:movieA_duration_plus_45) { (1 * 60 * 60) + (30 * 60) + (45 * 60) } # => 8100
  let!(:movieB_duration_plus_45) { (2 * 60 * 60) + (17 * 60) + (45 * 60) } # => 10920

  before do
    movieA.assign_movie_start_times
    movieB.assign_movie_start_times
    movieC.assign_movie_start_times
  end

  it "can call it's theater" do
    expect(movieA.theater).to eq theater
    movieA.theater = theater3
    expect(movieA.theater).to eq theater3
  end

  describe '#duration_in_minutes' do
    it 'returns the movie\'s duration in minutes' do
      expect(movieA.duration_in_minutes).to eq(90)
    end
  end

  describe '#assign_movie_start_times' do
    it 'adds the movie duration + 45 minutes to find the next start time' do
      expect(movieA.start_times[1]).to eq(theater.opens_at + movieA_duration_plus_45)
    end

    it 'stops adding show times when next showing is after the theater closes' do
      last_movie_show_time = theater.closes_at - movieA_duration_plus_45
      expect(movieA.start_times[-1]).to be < last_movie_show_time
    end
  end

  describe '#assign_first_showing' do
    it 'sets the first start time to the open time of theater' do
      expect(movieA.start_times.first).to eq(theater.opens_at)
      expect(movieB.start_times.first).to eq(theater2.opens_at)
      expect(movieC.start_times.first).to eq(theater3.opens_at)
    end
  end

  describe '#duration_plus_45_minutes' do
    it 'returns the original duration + 45 minutes (for clean up + trailers)' do
      expect(movieA.duration_plus_45_minutes).to eq(movieA_duration_plus_45)
      expect(movieB.duration_plus_45_minutes).to eq(movieB_duration_plus_45)
    end
  end

  describe '#round_up' do
    it 'rounds up showing to nearest 5 min marker' do
      movieB.start_times.each do |st|
        expect(st.min % 5 == 0).to be true
      end
    end
  end
end
