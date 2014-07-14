# -*- coding: utf-8 -*-
module RtmTime
  class De
    include RtmTime
    self.extend( RtmTime )

    #
    # [param] String num
    # [param] String unit
    #
    def assort( num, unit )
      case unit
      when /\At/ui
        @day  ||= num.to_i
      when /\As/ui
        @hour ||= num.to_f
      when /\Am/ui
        @min  ||= num.to_i
      end
    end
  end
end
