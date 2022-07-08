module TimeHelper
  extend ActiveSupport::Concern

  module ClassMethods
    
    def time_diff(start_time, end_time)
      seconds_diff = (start_time - end_time).to_i.abs
      hours = seconds_diff / 3600
      seconds_diff -= hours * 3600
      minutes = seconds_diff / 60
      seconds_diff -= minutes * 60
      seconds = seconds_diff
      "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
    end

  end

end