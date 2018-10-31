RSpec.describe Celluloid::Call::Sync, actor_system: :global do
  # TODO: these should be Call::Sync unit tests (without working on actual actors)

  let(:actor) { CallExampleActor.new }
  let(:logger) { Specs::FakeLogger.current }

  context "when obj does not respond to a method" do
    it "raises a NoMethodError" 


    context "when obj raises during inspect" do
      it "should emulate obj.inspect" 

    end
  end

  it "aborts with ArgumentError when a method is called with too many arguments" 


  it "preserves call chains across synchronous calls" 

end

