require 'chronic'
require 'shellout'
include Shellout

module Chronosphere
  module Middleware
    class Calendar < Base
      def call(env)

        cli_date = env["date"]

        parsed_date = Chronic.parse(cli_date)

        say Calendar(Date.parse(parsed_date.to_s)).print

        @app.call(env)
        
      end
    end
  end
end

