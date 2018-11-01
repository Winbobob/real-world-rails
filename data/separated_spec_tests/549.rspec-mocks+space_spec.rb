
module RSpec::Mocks
  RSpec.describe Space do
    let(:space) { Space.new }
    let(:dbl_1) { Object.new }
    let(:dbl_2) { Object.new }

    describe "#verify_all" do
      it "verifies all mocks within" 


      def define_singleton_method_on_recorder_for(klass, name, &block)
        recorder = space.any_instance_recorder_for(klass)
        (class << recorder; self; end).send(:define_method, name, &block)
      end

      it 'verifies all any_instance recorders within' 


      it 'does not reset the proxies (as that should be delayed until reset_all)' 

    end

    describe "#reset_all" do
      it "resets all mocks within" 

    end

    describe "#proxies_of(klass)" do
      it 'returns proxies' 


      def create_generations
        grandparent_class = Class.new
        parent_class      = Class.new(grandparent_class)
        child_class       = Class.new(parent_class)

        grandparent = grandparent_class.new
        parent      = parent_class.new
        child       = child_class.new

        return grandparent, parent, child
      end

      it 'returns only the proxies whose object is an instance of the given class' 


      it 'looks in the parent space for matching proxies' 

    end

    it 'tracks proxies in parent and child space separately' 


    it "only adds an instance once" 


    [:ensure_registered, :proxy_for].each do |method|
      describe "##{method}" do
        define_method :get_proxy do |the_space, object|
          the_space.__send__(method, object)
        end

        it 'returns the proxy for the given object' 


        it 'can stil return a proxy from a parent context' 


        it "does not store a parent's proxy in the child space" 

      end
    end

    describe "#registered?" do
      it 'returns true if registered in this space' 


      it 'returns true if registered in a parent space' 


      it 'returns false if not registered in this or a parent space' 

    end

    describe "#constant_mutator_for" do
      it 'returns the mutator for the given const name' 


      it 'can stil return a mutator from a parent context' 

    end

    describe "#any_instance_recorder_for" do
      it 'returns the recorder for the given class' 


      it 'can stil return a recorder from a parent context' 


      it "does not store a parent's proxy in the child space" 

    end

    it 'can be diffed in a failure when it has references to an error generator via a proxy' 


    def in_new_space_scope
      RSpec::Mocks.setup
      yield
    ensure
      RSpec::Mocks.teardown
    end
  end
end

