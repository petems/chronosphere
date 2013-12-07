require "middleware"

module Chronosphere
  module Middleware
    autoload :Base, "chronosphere/middleware/base"
    autoload :Calendar, "chronosphere/middleware/calendar"
    autoload :Since, "chronosphere/middleware/since"
    autoload :Until, "chronosphere/middleware/until"
    autoload :Weekday, "chronosphere/middleware/weekday"

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

    def self.sequence_until
      ::Middleware::Builder.new do
        use Until
      end
    end

    def self.sequence_weekday
      ::Middleware::Builder.new do
        use Weekday
      end
    end

  end
end
