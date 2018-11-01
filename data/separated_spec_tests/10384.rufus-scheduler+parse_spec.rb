
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler do

  describe '.parse' do

    def pa(s, opts={}); Rufus::Scheduler.parse(s, opts); end
    def paus(s); Rufus::Scheduler.parse(s).getutc.strftime('%c'); end

    it 'parses duration strings' 


    it 'parses datetimes' 


    it 'parses datetimes with timezones' 


    it 'parses datetimes with named timezones' 


    it 'parses datetimes (with the local timezone implicitly)' 


    it 'parses cronlines' 


    it 'raises on unparseable input' 


    it 'does not use Chronic if not present' 


    it 'uses Chronic if present' 


    it 'passes options to Chronic' 

  end

  describe '.parse_duration' do

    def pd(s)
      Rufus::Scheduler.parse_duration(s)
    end

    it 'parses duration strings' 


    it 'calls #to_s on its input' 


    it 'raises on wrong duration strings' 


    it 'returns nil on unreadable duration when no_error: true' 

  end

  describe '.to_duration' do

    def td(o, opts={})
      Rufus::Scheduler.to_duration(o, opts)
    end

    it 'turns integers into duration strings' 


    it 'ignores seconds and milliseconds if :drop_seconds => true' 


    it 'displays months if :months => true' 


    it 'turns floats into duration strings' 

  end

  describe '.to_duration_hash' do

    [

      [ 0, nil, { :s => 0 } ],
      [ 60, nil, { :m => 1 } ],
      [ 0.128, nil, { :s => 0.128 } ],
      [ 60.127, nil, { :m => 1, :s => 0.127 } ],
      [ 61.127, nil, { :m => 1, :s => 1.127 } ],
      [ 61.127, { :drop_seconds => true }, { :m => 1 } ],

    ].each do |f, o, h| # float, options, hash

      it "turns #{f.inspect} into #{h.inspect} #{o ? "(#{o.inspect})" : ''}" 

    end
  end
end


