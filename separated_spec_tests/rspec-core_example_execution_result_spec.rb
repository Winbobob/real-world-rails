module RSpec
  module Core
    class Example
      RSpec.describe ExecutionResult do
        it "supports ruby 2.1's `to_h` protocol" 


        it 'includes all defined attributes in the `to_h` hash even if not set' 


        it 'provides a `pending_fixed?` predicate' 


        describe "backwards compatibility" do
          it 'supports indexed access like a hash' 


          it 'supports indexed updates like a hash' 


          it 'can get and set user defined attributes like with a hash' 


          it 'supports `update` like a hash' 


          it 'can set undefined attribute keys through any hash mutation method' 


          it 'supports `merge` like a hash' 


          it 'supports blocks for hash methods that support one' 


          # It's IndexError on 1.8.7, KeyError on 1.9+
          fetch_not_found_error_class = defined?(::KeyError) ? ::KeyError : ::IndexError

          specify '#fetch treats unset properties the same as a hash does' do
            allow_deprecation
            er = ExecutionResult.new
            expect { er.fetch(:pending_message) }.to raise_error(fetch_not_found_error_class)
            er.pending_message = "some msg"
            expect(er.fetch(:pending_message)).to eq("some msg")
          end

          describe "status" do
            it 'returns a string when accessed like a hash' 


            it "sets the status to a symbol when assigned as a string via the hash interface" 


            it "is presented as a string when included in returned hashes" 


            it "is updated to a symbol when updated as a string via `update`" 


            it 'is presented as a symbol in `to_h`' 

          end
        end
      end
    end
  end
end

