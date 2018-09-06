module RSpec::Matchers::BuiltIn
  RSpec.describe All do

    it_behaves_like 'an RSpec matcher', :valid_value => ['A', 'A', 'A'], :invalid_value => ['A', 'A', 'B'], :disallows_negation => true do
      let(:matcher) { all( eq('A') ) }
    end

    describe 'description' do
      it 'provides a description' 

    end

    context 'when single matcher is given' do

      describe 'expect(...).to all(expected)' do

        it 'can pass' 


        describe 'failure message' do

          context 'when the matcher has single-line failure message' do
            it 'returns the index of the failed object' 


            it 'returns the indexes of all failed objects, not just the first one' 

          end


          context 'when the matcher has multi-line failure message' do
            it 'returns the index of the failed object' 


            it 'returns the indexes of all failed objects, not just the first one' 

          end

        end
      end
    end

    context 'when composed matcher is given' do

      describe 'expect(...).to all(expected)' do
        it 'can pass' 

      end

      describe 'failure message' do

        context 'when a single object fails' do
          it 'returns the index of the failed object for the composed matcher' 

        end

        context 'when a multiple objects fails' do
          it 'returns the indexes of the failed objects for the composed matcher, not just the first one' 

        end
      end
    end

    shared_examples "making a copy" do |copy_method|
      context "when making a copy via `#{copy_method}`" do

        let(:base_matcher) { eq(3) }
        let(:all_matcher) { all( base_matcher ) }
        let(:copied_matcher) { all_matcher.__send__(copy_method) }

        it "uses a copy of the base matcher" 


        context 'when using a custom matcher' do

          let(:base_matcher) { custom_include(3) }

          it 'copies custom matchers properly so they can work even though they have singleton behavior' 


        end

      end
    end

    include_examples 'making a copy', :clone
    include_examples 'making a copy', :dup

    context "when using a matcher instance that memoizes state multiple times in a composed expression" do
      it "works properly in spite of the memoization" 


      context "when passing a compound expression" do
        it "works properly in spite of the memoization" 

      end
    end

    context 'when the actual data does not define #each_with_index' do
      let(:actual) { 5 }

      it 'returns a failure message' 

    end

    context 'when the actual data does not include enumerable but defines #each_with_index' do
      let(:actual) do
        obj = Object.new
        def obj.each_with_index(&block); [5].each_with_index { |o,i| yield(o,i) }; end
        obj
      end

      it 'passes properly' 


      it 'fails properly' 

    end

  end
end

