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

  describe "since" do
    it "returns error string if you give a date in the future" do
      expect{@cli.since('next year')}.to raise_error(SystemExit)
      expect($stdout.string).to eq "You've asked for days since a date in the future!\nUse `chronosphere until 'next year' instead`\n"
    end

    it "returns the amount of days until a date" do
      @cli.since('a year ago')
      expect($stdout.string).to eq "It's been 365 days since a year ago\n"
    end
  end
end
