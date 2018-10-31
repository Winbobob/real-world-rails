RSpec.describe Celluloid::Supervision::Container, actor_system: :global do
  let(:queue_count) { 1 }

  before do
    SupervisionContainerHelper.reset!
    subject # init for easier debugging
    queue_count.times { SupervisionContainerHelper.pop! }
  end

  after do
    # TODO: hangs without condition on JRuby?
    subject.terminate if subject.alive?
  end

  context "when supervising a single actor" do
    subject do
      Class.new(Celluloid::Supervision::Container) do
        supervise type: MyContainerActor, as: :example
      end.run!(*registry)
    end

    let(:registry) { [] }

    it "runs applications" 


    context "with a private registry" do
      let(:registry) { Celluloid::Internals::Registry.new }

      it "accepts a private actor registry" 

    end

    it "removes actors from the registry when terminating" 


    it "allows external access to the internal registry" 

  end

  context "with multiple args" do
    subject do
      Class.new(Celluloid::Supervision::Container) do
        supervise type: MyContainerActor, as: :example, args: %i[foo bar]
      end.run!
    end

    it "passes them" 

  end

  context "with lazy evaluation" do
    subject do
      Class.new(Celluloid::Supervision::Container) do
        supervise type: MyContainerActor, as: :example, args: -> { :lazy }
      end.run!
    end

    it "evaluates correctly" 

  end

  xit("can remove members") do
  end
end

