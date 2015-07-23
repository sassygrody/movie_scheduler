require 'spec_helper'

describe 'Theater' do
  let!(:movieA) { Movie.new('A', '2009', 'PG-13', '1:30') }
  let!(:movieB) { Movie.new('B', '2015', 'G', '2:17') }
  let!(:movieC) { Movie.new('C', '2000', 'R', '1:45') }
  let!(:theater) { Theater.new('Webster', '10', '11:00', '23:00') }
  let!(:theater2) { Theater.new('City North', '6', '10:00', '22:00') }
  let!(:theater3) { Theater.new('Regal', '15', '12:00', '23:00') }
  let!(:movieA_duration_plus_45) { (1 * 60 * 60) + (30 * 60) + (45 * 60) } # => 8100
  let!(:movieB_duration_plus_45) { (2 * 60 * 60) + (17 * 60) + (45 * 60) } # => 10920

  before do
    theater.movies << movieA
  end
end
