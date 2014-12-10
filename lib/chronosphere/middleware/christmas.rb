# encoding: utf-8
module Chronosphere
  module Middleware
    class Christmas < Base
      def call(env)

        today = DateTime.now
        christmas = DateTime.new(DateTime.now.year, 12, 25)
        christmas = DateTime.new(DateTime.now.year+1, 12, 25) if today > christmas
        days_left = (christmas - today).to_i
        if days_left == 0
          say "\xF0\x9F\x8E\x84  Today is Christmas! \xF0\x9F\x8E\x84  Ho,ho,ho!  \xF0\x9F\x8E\x85 "
        else
          say "Only #{days_left} day#{"s" unless days_left==1} until Christmas!"
        end

        @app.call(env)

      end
    end
  end
end
