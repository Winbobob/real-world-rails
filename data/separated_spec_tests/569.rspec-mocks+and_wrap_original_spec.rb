RSpec.describe "and_wrap_original" do
  context "on a partial double" do
    let(:klass) do
      Class.new do
        def results
          (1..100).to_a
        end
      end
    end

    let(:instance) { klass.new }

    shared_examples "using and_wrap_original" do
      it "allows us to modify the results of the original method" 


      it "raises a name error if the method does not exist" 


      it "passes along the original method" 


      it "passes along the message arguments" 


      it "passes along any supplied block" 


      it "ignores previous stubs" 


      it "can be constrained by specific arguments" 

    end

    describe "allow(...).to receive(...).and_wrap_original" do
      it_behaves_like "using and_wrap_original" do
        let(:allow_it) { allow(instance) }
      end
    end

    describe "allow_any_instance_of(...).to receive(...).and_wrap_original" do
      it_behaves_like "using and_wrap_original" do
        let(:allow_it) { allow_any_instance_of(klass) }
      end
    end
  end

  context "on a pure test double" do
    let(:instance) { double :my_method => :my_value }

    it 'raises an error' 


    it 'raises an error even if the double object responds to the message' 

  end
end

