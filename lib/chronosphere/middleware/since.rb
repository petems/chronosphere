require 'chronic'

module Chronosphere
  module Middleware
    class Since < Base
      def call(env)

        cli_date = env["date"]

        parsed_date = Chronic.parse(cli_date)

        parsed_date = Date.parse(parsed_date.to_s)

        if (parsed_date > Date.today)
          say "You've asked for days since a date in the future!", :red
          say "Use `chronosphere until '#{cli_date}' instead`", :green
          exit 1
        end

        days_since = (Date.today - parsed_date).to_i

        say "It's been #{days_since} days since #{cli_date}"

        @app.call(env)

      end
    end
  end
end

