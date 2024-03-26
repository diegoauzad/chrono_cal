module CoreExtensions
  module Time
    extend ActiveSupport::Concern

    included do
      def adjust_to_nearest_half_hour
        minutes = self.min

        if minutes < 15
          self.change(min: 0, sec: 0)
        elsif minutes < 45
          self.change(min: 30, sec: 0)
        else
          # Adjust to the next hour and reset seconds to 00
          # Ensure hours are correctly adjusted if it's the end of the day
          next_hour = self + (60 - minutes).minutes
          next_hour.change(min: 0, sec: 0)
        end

      end

    end

  end
end