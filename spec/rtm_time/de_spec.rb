# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RtmTime::De do
  describe 'only integer' do
    context '2 Stunden 15 Minuten' do
      subject {
        RtmTime::De.parse( '2 Stunden 15 Minuten' ).to_h
      }
      it {
        should == {:day => 0, :hour => 2 , :min => 15}
      }
    end

    context '1 Stunde' do
      subject {
        RtmTime::De.parse( '1 Stunde' ).to_h
      }
      it {
        should == {:day => 0, :hour => 1, :min => 0}
      }
    end

    context '30 Minuten' do
      subject {
        RtmTime::De.parse( '30 Minuten' ).to_h
      }
      it {
        should == {:day => 0, :hour => 0, :min => 30}
      }
    end
  end
end
