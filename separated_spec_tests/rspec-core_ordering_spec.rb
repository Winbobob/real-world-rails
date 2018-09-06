module RSpec
  module Core
    module Ordering
      RSpec.describe Identity do
        it "does not affect the ordering of the items" 

      end

      RSpec.describe Random do
        describe '.order' do
          subject { described_class.new(configuration) }

          def item(n)
            instance_double(Example, :id => "./some_spec.rb[1:#{n}]")
          end

          let(:configuration)  { RSpec::Core::Configuration.new }
          let(:items)          { 10.times.map { |n| item(n) } }
          let(:shuffled_items) { subject.order items }

          it 'shuffles the items randomly' 


          context 'given multiple calls' do
            it 'returns the items in the same order' 

          end

          def order_with(seed)
            configuration.seed = seed
            subject.order(items)
          end

          it 'has a good distribution', :slow do
            orderings = 1.upto(1000).map do |seed|
              order_with(seed)
            end.uniq

            # Here we are making sure that our hash function used for  ordering has a
            # good distribution. Each seed produces a deterministic order and we want
            # 99%+ of 1000 to be different.
            expect(orderings.count).to be > 990
          end

          context "when given a subset of a list that was previously shuffled with the same seed" do
            it "orders that subset the same as it was ordered before" 

          end

          context 'given randomization has been seeded explicitly' do
            before { @seed = srand }
            after  { srand @seed }

            it "does not affect the global random number generator" 

          end
        end
      end

      RSpec.describe Custom do
        it 'uses the block to order the list' 

      end

      RSpec.describe Registry do
        let(:configuration) { Configuration.new }
        subject(:registry) { Registry.new(configuration) }

        describe "#used_random_seed?" do
          it 'returns false if the random orderer has not been used' 


          it 'returns false if the random orderer has been fetched but not used' 


          it 'returns true if the random orderer has been used' 

        end

        describe "#fetch" do
          it "gives the registered ordering when called with a symbol" 


          context "when given an unrecognized symbol" do
            it 'invokes the given block and returns its value' 


            it 'raises an error if no block is given' 

          end
        end
      end
    end
  end
end

