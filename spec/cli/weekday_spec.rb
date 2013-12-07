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

  describe "weekday" do
    it "returns the day of the week from a date" do
      @cli.weekday('december 25th')
      expect($stdout.string).to eq "The weekday of december 25th is Tuesday\n"
    end
  end
end
