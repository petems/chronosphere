require 'chronic'

module Chronosphere
  module Middleware
    class Weekday < Base
      def call(env)

        cli_date = env["date"]

        parsed_date = Chronic.parse(cli_date)

        parsed_date = Date.parse(parsed_date.to_s)

        say "The weekday of #{cli_date} is #{parsed_date.strftime('%A')}"

        @app.call(env)
      end
    end
  end
end

