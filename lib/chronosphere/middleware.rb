require "middleware"

module Chronosphere
  module Middleware
    autoload :Base, "chronosphere/middleware/base"
    autoload :Calendar, "chronosphere/middleware/calendar"
    autoload :Since, "chronosphere/middleware/since"

    def self.sequence_calendar
      ::Middleware::Builder.new do
        use Calendar
      end
    end

    def self.sequence_since
      ::Middleware::Builder.new do
        use Since
      end
    end

  end
end
