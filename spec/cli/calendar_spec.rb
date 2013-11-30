require 'spec_helper'
require 'timecop'

describe Chronosphere::CLI do
  include_context "spec"

  before do
    Timecop.freeze(Time.local(2012))
  end

  after do
    Timecop.return
  end

  describe "calendar" do
    it "shows a shows a calendar for a given string" do
      @cli.calendar('next month')
      expect($stdout.string).to eq "   February 2012      \nMo Tu We Th Fr Sa Su  \n       1  2  3  4  5  \n 6  7  8  9 10 11 12  \n13 14 15 16 17 18 19  \n20 21 22 23 24 25 26  \n27 28 29              \n\n"
    end
  end
end
