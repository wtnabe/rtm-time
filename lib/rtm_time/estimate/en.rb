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
      when /\Ad/ui
        @day  ||= num.to_i
      when /\Ah/ui
        @hour ||= num.to_f
      when /\Am/ui
        @min  ||= num.to_i
      end
    end
  end
end
