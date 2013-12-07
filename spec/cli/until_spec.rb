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
    it "returns error string if you give a date in the past" do
      expect{@cli.since('next year')}.to raise_error(SystemExit)
      expect($stdout.string).to eq "You've asked for days since a date in the future!\nUse `chronosphere until 'next year' instead`\n"
    end

    it "returns the amount of days until a date" do
      @cli.until('a year from now')
      expect($stdout.string).to eq "It'll be 366 days until a year from now\n"
    end
  end
end
