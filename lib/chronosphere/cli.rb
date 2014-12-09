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
    desc "cal", "An alias for calendar"
    long_desc "`chronosphere help calendar` for full details"
    alias :cal :calendar

    desc "christmas", "Get days until christmas"
    def christmas
      Middleware.sequence_christmas.call()
    end

    desc "since", "Show the days since a certain date and todays date"
    long_desc "This will print the days since a certain date"
    def since(date)
      Middleware.sequence_since.call({"date" => date})
    end

    desc "until", "Show the days until a certain date and todays date"
    long_desc "This will print the days a certain date is away"
    def until(date)
      Middleware.sequence_until.call({"date" => date})
    end

    desc "weekday", "Show the weekday of a given date"
    long_desc "This will print the weekday (Monday, Tuesday etc) of a given date"
    def weekday(date)
      Middleware.sequence_weekday.call({"date" => date})
    end

    desc "version", "Show version"
    def version
      say "Chronosphere #{Chronosphere::VERSION}"
    end

  end
end

