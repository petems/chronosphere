require 'spec_helper'

shared_context "spec" do
  let(:app)              { lambda { |env| } }
  let(:env)              { {} }

  before(:each) do
    $stdout.sync = true
    $stderr.sync = true

    @cli = Chronosphere::CLI.new

    # Keep track of the old stderr / out
    @orig_stderr = $stderr
    @orig_stdout = $stdout

    # Make them strings so we can manipulate and compare.
    $stderr = StringIO.new
    $stdout = StringIO.new
  end

  after(:each) do
    # Reassign the stderr / out so rspec can have it back.
    $stderr = @orig_stderr
    $stdout = @orig_stdout
  end

end
