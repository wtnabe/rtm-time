# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RtmTime::Ja do
  describe 'onle integer' do
    context '2時間および15分' do
      subject {
        RtmTime::Ja.parse( '2時間および15分' ).to_h
      }
      it {
        should == {:day => nil, :hour => 2 , :min => 15}
      }
    end

    context '15分と2時間' do
      subject {
        RtmTime::Ja.parse( '15分と2時間' ).to_h
      }
      it {
        should == {:day => nil, :hour => 2, :min => 15}
      }
    end
  end
end
