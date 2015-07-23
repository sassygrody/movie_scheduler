require 'spec_helper'

describe 'Theater' do
  let!(:movieA) { Movie.new('A', '2009', 'PG-13', '1:30') }
  let!(:theater) { Theater.new('Webster', '10', '11:00', '23:00') }

  before do
    theater.movies << movieA
  end

  describe 'hours of operation' do
    it 'displays the theaters open hours' do
      expect(theater.hours_of_operation).to eq('11:0 to 23:0')
    end
  end
end
