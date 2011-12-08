# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/en'

module RtmTime
  class Ja < En
    #
    # [param] String num
    # [param] String unit
    #
    def assort( num, unit )
      super
      case unit
      when /\A日/u
        @day  = num.to_i
      when /\A時/u
        @hour = num.to_f
      when /\A分/u
        @min  = num.to_i
      end
    end
  end
end
