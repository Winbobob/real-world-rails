module Concurrent

  class Channel

    RSpec.describe Tick, edge: true do

      it 'initializes to current time when no argument given' 


      it 'initializes to the given monotonic time' 


      specify '#utc returns a Time object in UTC' do
        t = subject.utc
        expect(subject.utc).to be_a Time
        expect(subject.utc.zone).to eq 'UTC'
      end

      specify '#epoch returns the UTC time as epoch seconds' do
        expect(subject.utc.to_f).to eq subject.epoch
      end

      specify '#to_s formats as a time', :truffle_bug => true do
        expect(subject.to_s).to match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d{6} \+\d{4} UTC/)
      end

      context 'comparison' do

        it 'correctly compares to a Numeric (monotonic)' 


        it 'correctly compares to a Time' 


        it 'correctly compares to a Tick' 

      end
    end
  end
end

