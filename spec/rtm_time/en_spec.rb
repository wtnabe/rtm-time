# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RtmTime::En do
  describe 'only integer' do
    context '2h15m' do
      subject {
        RtmTime::En.parse( '2h15m' )
      }
      it {
        subject.to_hash.should == {:day => 0, :hour => 2, :min => 15}
      }
      it {
        subject.to_a.should == [0, 2, 15]
      }
    end

    context ' 2 hrs 15 min ' do
      subject {
        RtmTime::En.parse( ' 2 hrs 15 min ' )
      }
      it {
        subject.to_h.should == {:day => 0, :hour => 2, :min => 15}
      }
      it {
        subject.to_a.should == [0, 2, 15]
      }
    end

    context '1d 2h' do
      subject {
        RtmTime::En.parse('1d 2h')
      }
      it {
        subject.to_h.should == {:day => 1, :hour => 2, :min => 0}
      }
      it {
        subject.to_a.should == [1, 2, 0]
      }
    end
  end

  describe 'float' do
    context '1.2h' do
      subject {
        RtmTime::En.parse( '1.2h' ).to_h
      }
      it {
        should == {:day => 0, :hour => 1, :min => 12}
      }
    end

    context '1h' do
      subject {
        RtmTime::En.parse( '1h' ).to_h
      }
      it {
        should == {:day => 0, :hour => 1, :min => 0}
      }
    end

    context '10m 1.5h ' do
      subject {
        RtmTime::En.parse( '10m 1.5h ' ).to_h
      }
      it {
        should = {:day => 0, :hour => 1, :min => 40}
      }
    end
  end

  describe 'unsupported' do
    context '1.2時間' do
      subject {
        RtmTime::En.parse( '1.2時間' ).to_h
      }
      it {
        should == {:day => 0, :hour => 0, :min => 0}
      }
    end
  end
end
