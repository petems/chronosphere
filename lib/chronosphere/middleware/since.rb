require 'chronic'

module Chronosphere
  module Middleware
    class Since < Base
      def call(env)

        cli_date = env["date"]

        parsed_date = Chronic.parse(cli_date)

        days_since = (Date.today - Date.parse(parsed_date.to_s)).to_i

        say "It's been #{days_since} days since #{cli_date}"

        @app.call(env)

      end
    end
  end
end

