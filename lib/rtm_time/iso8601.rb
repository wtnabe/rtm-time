require 'time'

module RtmTime
  class InvalidTime < StandardError; end

  #
  # convert from various object to ISO8601(UTC) string
  #
  # [param]  Object
  # [return] String
  #
  def self.iso8601( time = Time.now )
    t = nil

    case time
    when String
      t = Time.parse(time)
    when Integer
      t = Time.at(time)
    when Time
      t = time
    else
      if time.respond_to? :to_time
        t = time.to_time
      else
        raise InvalidTime, time
      end
    end

    t.utc.iso8601 if t
  end
end
