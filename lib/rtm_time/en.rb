# -*- coding: utf-8 -*-
module RtmTime
  class En
    include RtmTime
    self.extend( RtmTime )

    #
    # [param] String num
    # [param] String unit
    #
    def assort( num, unit )
      case unit
      when /\Ad/u
        @day  ||= num.to_i
      when /\Ah/u
        @hour ||= num.to_f
      when /\Am/u
        @min  ||= num.to_i
      end
    end
  end
end
