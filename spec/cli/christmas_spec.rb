require 'spec_helper'
require 'timecop'

describe Chronosphere::CLI do
  include_context "spec"

  after do
    Timecop.return
  end

  describe "christmas" do
    it "gives number of days until christmas before" do
      new_time = Time.local(2012, 12, 15)
      Timecop.freeze(new_time)
      @cli.christmas
      expect($stdout.string).to include "Only 10 days until Christmas!\n"
    end

    it "gives number of days until christmas before in singular days" do
      new_time = Time.local(2012, 12, 24)
      Timecop.freeze(new_time)
      @cli.christmas
      expect($stdout.string).to include "Only 1 day until Christmas!\n"
    end

    it "returns happy message on the day" do
      new_time = Time.local(2012, 12, 25)
      Timecop.freeze(new_time)
      @cli.christmas
      expect($stdout.string).to include "\xF0\x9F\x8E\x84  Today is Christmas! \xF0\x9F\x8E\x84  Ho,ho,ho!  \xF0\x9F\x8E\x85"
    end

    it "gives number of days until christmas after" do
      new_time = Time.local(2012, 1, 1)
      Timecop.freeze(new_time)
      @cli.christmas
      expect($stdout.string).to include "Only 359 days until Christmas!\n"
    end
  end
end
