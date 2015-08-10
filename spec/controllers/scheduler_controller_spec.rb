require 'spec_helper'

describe 'SchedulerController' do
  let!(:movieA) { Movie.new(title: 'A', year: '2009', rating: 'PG-13', duration: '1:30') }
  let!(:movieB) { Movie.new(title: 'B', year: '2015', rating: 'G', duration: '2:17') }
  let!(:theater) { Theater.new(name: 'Webster', screen_count: '10', opens_at: '11:00', closes_at: '23:00') }
  let!(:theater2) { Theater.new(name: 'City North', screen_count: '6', opens_at: '10:00', closes_at: '22:00') }

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
      scheduler.parse_theater_info(open_row)
    end
  end

  describe '#assign_movies_to_theaters' do
    xit 'creates new movie objects that are distinct to the theater' do
    end
  end
end
