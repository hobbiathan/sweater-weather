class RoutePoro
  attr_reader :start_city, :destination_city, :travel_time

  def initialize(data)
    @start_city = data[:route][:locations][0][:adminArea5] + ", "  + data[:route][:locations][0][:adminArea3]
    @destination_city = data[:route][:locations][1][:adminArea5] + ", "  + data[:route][:locations][1][:adminArea3]
    @travel_time = format_time(data[:route][:realTime])

  end

  private
    def format_time(seconds)
      fmt_string = "%02d:%02d:%02d" % [seconds / 3600, seconds / 60 % 60, seconds % 60]

      fmt_string[0..1] + " hours " + fmt_string[3..4] + " min"
    end
end
