# -*- coding: utf-8 -*-

$KCODE = 'u' unless defined? ::Encoding

module RtmTime
  attr_reader :day, :hour, :min

  def self.extended( obj )
    obj.class_eval {
      def obj.parse( time_str )
        self.new.parse( time_str )
      end
    }
  end

  #
  # [param] String time_str
  #
  # 解釈できない場合、エラーがユーザーに feedback されるケースと単に無
  # 視されるケースがある
  #
  def parse( time_str )
    @day  = nil
    @hour = nil
    @min  = nil

    parsed = time_str.scan(/(?:([0-9\.]+)\s*([^0-9]+|\z))/u)

    if parsed.size > 0
      #  d, h, m の順番にも縛りはない
      parsed.each { |num, unit|
        assort( num, unit )
      }
      @day  = @day.to_i
      @min  = (@min.to_i + (@hour - @hour.to_i) * 60).round
      @hour = @hour.to_i
    end

    self
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
end

Dir.glob( File.dirname(__FILE__) + '/**/*.rb' ).each { |f|
  require f.sub( /\.rb\z/, '' )
}
