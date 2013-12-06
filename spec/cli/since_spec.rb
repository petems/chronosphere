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
    it "returns the amount of days since a date" do
      @cli.since('a year ago')
      expect($stdout.string).to eq "It's been 365 days since a year ago\n"
    end
  end
end
