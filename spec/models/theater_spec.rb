require 'spec_helper'

describe 'Theater' do
  let!(:movieA) { Movie.new(title: 'A', year: '2009', rating: 'PG-13', duration: '1:30') }
  let!(:theater) { Theater.new(name: 'Webster', screen_count: '10', opens_at: '11:00', closes_at: '23:00') }

  before do
    theater.movies << movieA
  end

  describe 'hours of operation' do
    it 'displays the theaters open hours' do
      expect(theater.hours_of_operation).to eq('11:00 AM to 11:00 PM')
    end
  end
end
