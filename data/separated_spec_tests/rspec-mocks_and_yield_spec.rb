RSpec.describe RSpec::Mocks::Double do

  let(:obj) { double }

  describe "#and_yield" do
    context 'when the method double has been constrained by `with`' do
      it 'uses the default stub if the provided args do not match' 

    end

    context "with eval context as block argument" do

      it "evaluates the supplied block as it is read" 


      it "passes an eval context object to the supplied block" 


      it "evaluates the block passed to the stubbed method in the context of the supplied eval context" 


      context "and no yielded arguments" do

        it "passes when expectations set on the eval context are met" 


        it "fails when expectations set on the eval context are not met" 


      end

      context "and yielded arguments" do

        it "passes when expectations set on the eval context and yielded arguments are met" 


        context "that are optional", :if => RSpec::Support::RubyFeatures.optional_and_splat_args_supported? do
          it "yields the default argument when the argument is not given" 


          it "yields given argument when the argument is given" 

        end

        it 'can yield to a block that uses `super`' 


        it "fails when expectations set on the eval context and yielded arguments are not met" 

      end
    end
  end
end

