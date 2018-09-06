require 'spec_helper'

describe FSEvent do

  before(:each) do
    @results = []
    # lambdas enforce arity...
    callback = lambda do |paths|
      @results += paths
    end
    @fsevent = FSEvent.new
    @fsevent.watch @fixture_path.to_s, {:latency => 0.3, :no_defer => true}, &callback
  end

  it "shouldn't pass anything to watch when instantiated without a path" 


  it "should pass path and block to watch when instantiated with them" 


  it "should have a watcher_path that resolves to an executable file" 


  it "should catch new file" 


  it "should catch file update" 


  it "should catch files update" 


  def run
    sleep 1
    Thread.new { @fsevent.run }
    sleep 1
  end

  def stop
    sleep 1
    @fsevent.stop
  end

end

