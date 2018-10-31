RSpec.describe Celluloid::Condition, actor_system: :global do
  let(:logger) { Specs::FakeLogger.current }

  class ConditionExample
    include Celluloid

    attr_reader :condition, :signaled_times

    def initialize
      @condition = Condition.new

      @waiting = false
      @signaled_times = 0
    end

    def signal_condition(condition, value)
      condition.signal value
    end

    def wait_for_condition(timeout = nil)
      @waiting = true
      begin
        value = @condition.wait(timeout)
        @signaled_times += 1
      ensure
        @waiting = false
      end

      value
    end

    def waiting?
      @waiting
    end
  end

  let(:actor) { ConditionExample.new }
  after { actor.terminate rescue nil }

  it "sends signals" 


  it "broadcasts signals" 


  it "sends values along with signals" 


  it "supports running blocks with value once obtained" 


  it "supports waiting outside actors" 


  it "times out inside normal Threads" 


  it "times out inside Tasks" 

end

