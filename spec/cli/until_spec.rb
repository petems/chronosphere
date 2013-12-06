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

  describe "until" do
    it "returns the amount of days until a date" do
      @cli.until('a year from now')
      expect($stdout.string).to eq "It'll be 366 days until a year from now\n"
    end
  end
end
