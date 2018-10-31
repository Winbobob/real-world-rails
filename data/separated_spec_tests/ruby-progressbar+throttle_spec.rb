require 'spec_helper'
require 'ruby-progressbar/progress'

class    ProgressBar
describe Throttle do
  let(:timer) { ProgressBar::Timer.new(:time => ::Time) }

  it 'yields the first time if the throttle rate is given and the timer is not started' 


  it 'does not yield after the initial yield if the period has not passed yet' 


  it 'always yields if forced to, even after the initial yield or if the period ' \
     'has not passed' do

    throttle = ProgressBar::Throttle.new(:throttle_rate  => 10,
                                         :throttle_timer => timer)
    timer.start

    throttle.choke {}

    yielded = 0

    25.times do
      Timecop.freeze(1)

      throttle.choke(:force_update_if => true) do
        yielded += 1
      end
    end

    Timecop.return

    expect(yielded).to eql 25
  end

  it 'yields if the period has passed, even after the initial yield' 


  it 'does not yield after a previous yield if the period has not passed yet' 


  it 'yields after the period has passed, even after a previous yield' 


  it 'does not throttle if no throttle rate is given' 

end
end

