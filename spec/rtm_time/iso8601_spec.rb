require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RtmTime do
  describe 'iso8601' do
    before {
      ENV['TZ'] = 'JST-9'
    }

    context 'with no args' do
      subject {
        RtmTime.iso8601
      }
      it {
        should == Time.now.utc.iso8601
      }
    end
    context 'with string' do
      subject {
        RtmTime.iso8601( '2011-12-01' )
      }
      it {
        should == '2011-11-30T15:00:00Z'
      }
    end
    context 'with integer' do
      subject {
        RtmTime.iso8601(1322665200)
      }
      it {
        should == '2011-11-30T15:00:00Z'
      }
    end
    context 'with time object' do
      subject {
        RtmTime.iso8601(Time.parse('2011-12-01'))
      }
      it {
        should == '2011-11-30T15:00:00Z'
      }
    end
    context 'with other object respond_to :to_time' do
      subject {
        RtmTime.iso8601(Date.parse('2011-12-01'))
      }
      it {
        should == '2011-11-30T15:00:00Z'
      }
    end
    context 'with other object not respond_to :to_time' do
      subject {
        RtmTime.iso8601( %w(2011-12-01) )
      }
      it {
        lambda { subject }.should raise_error(RtmTime::InvalidTime)
      }
    end
  end
end
