class UnsortableObject
  def initialize(id)
    @id = id
  end

  def inspect
    @id.to_s
  end

  def ==(other)
    false
  end
end

# AR::Relation is meant to act like a collection, but does
# not include `Enumerable`. It does implement `to_ary`.
class FakeActiveRecordRelation
  def initialize(records)
    @records = records
  end

  def to_ary
    @records
  end
end

RSpec.describe "should =~ array", :uses_should do
  it "passes a valid positive expectation" 


  it "fails an invalid positive expectation" 


  context "when the array defines a `=~` method" do
    it 'delegates to that method rather than using the contain_exactly matcher' 

  end

  context 'when the array defines a `send` method' do
    it 'still works' 

  end

  context "when the array undefines `=~`" do
    it 'still works' 

  end
end

RSpec.describe "should_not =~ [:with, :multiple, :args]", :uses_should do
  it "fails when the arrays match" 


  it "fails when the arrays match in a different order" 


  it "passes when there are extra elements in the array" 


  it "passes when there are elements missing from the array" 

end

RSpec.describe "using contain_exactly with expect" do
  it "passes a valid positive expectation" 


  it "fails an invalid positive expectation" 


  it "passes for an out of order valid positive expectation with hashes" 


  it "passes for an in order valid positive expectation with hashes" 


  it 'works with strict test doubles (which have not defined `<=>`)' 


  it "does not support strings (which have no standard way to be enumerated: bytes, chars or lines)" 


  it "supports ranges" 

end

RSpec.describe "expect(array).to contain_exactly(*other_array)" do
  it_behaves_like "an RSpec matcher", :valid_value => [1, 2], :invalid_value => [1] do
    let(:matcher) { contain_exactly(2, 1) }
  end

  it 'is also exposed as `match_array` (with unsplatted args)' 


  it "passes if target contains all items" 


  it "passes if target contains all items out of order" 


  it 'fails if the expected array is empty and the actual array is non-empty' 


  it 'fails if the actual array is empty and the expected array is non-empty' 


  def timeout_if_not_debugging(time)
    in_sub_process_if_possible do
      require 'timeout'
      return yield if defined?(::Debugger)
      Timeout.timeout(time) { yield }
    end
  end

  it 'fails a match of 11 items with duplicates in a reasonable amount of time' 


  it "fails if target includes extra items" 


  it "fails if target is missing items" 


  it "fails if target is missing items and has extra items" 


  it "sorts items in the error message if they all respond to <=>" 


    it "does not sort items in the error message if they don't all respond to <=>" 


  it "accurately reports extra elements when there are duplicates" 


  it "accurately reports missing elements when there are duplicates" 

end

RSpec.describe "expect(...).not_to contain_exactly(:with, :multiple, :args)" do
  it "fails when the arrays match" 


  it "fails when the arrays match in a different order" 


  it "passes when there are extra elements in the array" 


  it "passes when there are elements missing from the array" 

end

RSpec.describe "matching against things that aren't arrays" do
  it "fails with nil and the expected error message is given" 


  it "fails with a float and the expected error message is given" 


  it "fails with a string and the expected error message is given" 


  it 'works with other collection objects' 


  it 'works with non-enumerables that implement `to_ary`' 

end

RSpec.describe "Composing `contain_exactly` with other matchers" do
  context "when it is compared to multiple possible matches" do
    it 'works properly when passed as an argument in its aliased form' 

  end

  describe "expect(...).to contain_exactly(matcher, matcher)" do
    it 'passes when the array matches the matchers in the same order' 


    it 'passes when the array matches the matchers in a different order' 


    it 'fails with a useful message when there is an extra element' 


    it 'fails with a useful message when there is a missing element' 


    it 'pairs up the items in order to minimize the number of unpaired items' 


    it 'provides a description' 


    context 'when an earlier matcher matches more strictly than a later matcher' do
      it 'works when the actual items match in the same order' 


      it 'works when the actual items match in reverse order' 


      it 'can handle multiple sets of overlapping matches' 

    end

    it "can use `a_value_within` and `a_string_starting_with` against multiple types of values" 


    context 'when a later matcher matches more strictly than an earlier matcher' do
      it 'works when the actual items match in the same order' 


      it 'works when the actual items match in reverse order' 

    end
  end

  describe "expect(...).to_not contain_exactly(matcher, matcher)" do
    it 'fails when the array matches the matchers' 


    it 'passes when there is an extra element' 


    it 'passes when there is a missing element' 


  end
end

module RSpec
  module Matchers
    module BuiltIn
      class ContainExactly
        RSpec.describe PairingsMaximizer do
          it 'finds unmatched expected indexes' 


          it 'finds unmatched actual indexes' 


          describe "finding indeterminate indexes" do
            it 'does not include unmatched indexes' 


            it 'does not include indexes that are reciprocally to exactly one index' 


            it 'includes indexes that have multiple matches' 


            it 'includes indexes that have one match which has multiple matches' 

          end

          describe "#unmatched_item_count" do
            it 'returns the count of unmatched items' 

          end

          describe "#find_best_solution" do
            matcher :produce_result do |unmatched_expected, unmatched_actual|
              match do |result|
                result.candidate? &&
                result.unmatched_expected_indexes == unmatched_expected &&
                result.unmatched_actual_indexes   == unmatched_actual
              end

              failure_message do |result|
                if result.candidate_result?
                  "expected a complete solution, but still had indeterminate indexes: " +
                  "expected: #{result.indeterminate_expected_indexes.inspect}; " +
                  "actual: #{result.indeterminate_actual_indexes.inspect}"
                elsif result.unmatched_expected_indexes != unmatched_expected
                  "expected unmatched_expected_indexes: #{unmatched_expected.inspect} " +
                  "but got: #{result.unmatched_expected_indexes.inspect}"
                elsif result.unmatched_actual_indexes != unmatched_actual
                  "expected unmatched_actual_indexes: #{unmatched_actual.inspect} " +
                  "but got: #{result.unmatched_actual_indexes.inspect}"
                end
              end
            end

            it 'returns no unmatched indexes when everything reciprocally matches one item' 


            it 'returns unmatched indexes for everything that has no matches' 


            it 'searches the solution space for a perfectly matching solution' 

          end
        end
      end
    end
  end
end

