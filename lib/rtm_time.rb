# -*- coding: utf-8 -*-

$KCODE = 'u' unless defined? ::Encoding

class RtmTime
  def initialize( time_str )
    @day  = nil
    @hour = nil
    @min  = nil

    parse( time_str )
  end
  attr_reader :day, :hour, :min

  def self.parse( time_str )
    RtmTime.new( time_str )
  end

  #
  # [param] String time_str
  #
  # 解釈できない場合、エラーがユーザーに feedback されるケースと単に無
  # 視されるケースがある
  #
  def parse( time_str )
    parsed = time_str.scan(/(?:([0-9\.]+)\s*([^0-9]+|\z))/u)

    if parsed.size > 0
      #  d, h, m の順番にも縛りはない
      parsed.each { |num, unit|
        assort( num, unit )
      }
      @min  = (@min.to_i + (@hour - @hour.to_i) * 60).round
      @hour = @hour.to_i
    end
  end

  #
  # [return] Array
  #
  def to_a
    [day, hour, min]
  end

  #
  # [return] Hash
  #
  def to_h
    {:day => day, :hour => hour, :min => min}
  end
  alias_method :to_hash, :to_h

  #
  # [param] String num
  # [param] String unit
  #
  def assort( num, unit )
    case unit
    when /\A(d|日)/u
      @day  = num.to_i
    when /\A(h|時)/u
      @hour = num.to_f
    when /\A(m|分)/u
      @min  = num.to_i
    end
  end
end
