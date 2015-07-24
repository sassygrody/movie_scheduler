require 'spec_helper'

describe 'SchedulerController' do
  let!(:movieA) { Movie.new('A', '2009', 'PG-13', '1:30') }
  let!(:movieB) { Movie.new('B', '2015', 'G', '2:17') }
  let!(:theater) { Theater.new('Webster', '10', '11:00', '23:00') }
  let!(:theater2) { Theater.new('City North', '6', '10:00', '22:00') }

  let(:open_row) { ['Open', 'City North', '5', '13:15', '23:00'] }
  let(:book_row) { ['Book', 'MovieA', '1998', 'R', '2:15'] }
  let(:show_row) { ['Show', 'A', 'Webster'] }
  let(:scheduler) { SchedulerController.new }

  describe '#schedule_movies' do
    describe 'CSV parsing' do
      it 'takes in a file from user input' do
        allow(CSV).to receive(:foreach).and_return(open_row + book_row + show_row)
      end
    end
  end

  describe '#parse_theater_info' do
    xit 'creates a new theater object' do
      @list_of_theaters = []
      @theater = theater
      expect(scheduler.parse_theater_info(open_row)).to eq([])
    end
  end

  describe '#assign_movies_to_theaters' do
    xit 'creates new movie objects' do
    end

    xit 'adds new object to theaters collection' do
      expect(theater.movies).to include(movieA)
    end
  end
end
