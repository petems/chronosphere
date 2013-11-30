require "middleware"

module Chronosphere
  module Middleware
    autoload :Base, "chronosphere/middleware/base"
    autoload :Calendar, "chronosphere/middleware/calendar"

    def self.sequence_calendar
      ::Middleware::Builder.new do
        use Calendar
      end
    end

  end
end
