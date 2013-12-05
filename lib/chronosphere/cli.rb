require 'thor'

module Chronosphere
  autoload :Middleware, "chronosphere/middleware"

  class CLI < Thor
    include Thor::Actions
    ENV['THOR_COLUMNS'] = '120'

    !check_unknown_options

    map "--version"      => :version,
        "-v"             => :version

    desc "help [COMMAND]", "Describe commands or a specific command"
    def help(meth=nil)
      super
      if !meth
        say "To learn more or to contribute, please see github.com/petems/chronosphere"
      end
    end

    desc "calendar", "Show a ascii calendar for a given date"
    long_desc "This will print out an ascii calendar for a given date"
    def calendar(date)
      Middleware.sequence_calendar.call({"date" => date})
    end

    desc "since", "Show the days since a certain date and todays date"
    long_desc "This will print the days since a certain date"
    def since(date)
      Middleware.sequence_since.call({"date" => date})
    end

    desc "version", "Show version"
    def version
      say "Chronosphere #{Chronosphere::VERSION}"
    end

  end
end

