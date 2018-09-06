class EveryActor
  include Celluloid

  def initialize
    @trace = []
    @times = []
    @start = Time.now

    every(1) { log(1) }
    every(2) { log(2) }
    every(1) { log(11) }
    every(2) { log(22) }
  end

  def log(t)
    @trace << t

    offset = Time.now - @start
    @times << offset

    # puts "log(#{t}) @ #{offset}"
  end

  attr_reader :trace
  attr_reader :times
end

RSpec.describe "Celluloid::Actor timers" do
  it "run every(t) task several times" 

end

