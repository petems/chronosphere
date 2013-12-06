require 'chronic'

module Chronosphere
  module Middleware
    class Until < Base
      def call(env)

        cli_date = env["date"]

        parsed_date = Chronic.parse(cli_date)

        days_since = (Date.parse(parsed_date.to_s) - Date.today).to_i

        say "It'll be #{days_since} days until #{cli_date}"

        @app.call(env)
      end
    end
  end
end

