RSpec.describe Celluloid::Proxy::Abstract do
  around do |ex|
    Celluloid.boot
    ex.run
    Celluloid.shutdown
  end

  let(:task_klass) { Celluloid.task_class }
  let(:actor_class) { ExampleActorClass.create(CelluloidSpecs.included_module, task_klass) }
  let(:actor) { actor_class.new "Troy McClure" }

  let(:logger) { Specs::FakeLogger.current }

  it "should be eql? to self" 


  it "should be eql? to self even if dead" 


  it "should not be eql? to other proxy objects" 


  it "should be possible to compare with non-proxy objects" 

end

