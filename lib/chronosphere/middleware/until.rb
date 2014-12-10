require 'chronic'

module Chronosphere
  module Middleware
    class Until < Base
      def call(env)

        cli_date = env["date"]

        parsed_date = Chronic.parse(cli_date)

        parsed_date = Date.parse(parsed_date.to_s)

        if (parsed_date < Date.today)
          say "You've asked for days until a date in the past!", :red
          say "Use `chronosphere since '#{cli_date}' instead`", :green
          exit 1
        end

        days_until = (Date.parse(parsed_date.to_s) - Date.today).to_i

        say "It'll be #{days_until} days until #{cli_date}"

        @app.call(env)
      end
    end
  end
end

