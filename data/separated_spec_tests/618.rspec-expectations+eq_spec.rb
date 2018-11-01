module RSpec
  module Matchers
    RSpec.describe "eq" do
      it_behaves_like "an RSpec matcher", :valid_value => 1, :invalid_value => 2 do
        let(:matcher) { eq(1) }
      end

      it "is diffable" 


      it "matches when actual == expected" 


      it "does not match when actual != expected" 


      it "compares by sending == to actual (not expected)" 


      it "describes itself" 


      it "provides message, expected and actual on #failure_message" 


      it "provides message, expected and actual on #negative_failure_message" 


      context "with Time objects" do
        RSpec::Matchers.define :a_string_with_differing_output do
          match do |string|
            time_strings = /expected: (.+)\n.*got: (.+)$/.match(string).captures
            time_strings.uniq.count == 2
          end
        end

        let(:time1) { Time.utc(1969, 12, 31, 19, 01, 40, 101) }
        let(:time2) { Time.utc(1969, 12, 31, 19, 01, 40, 102) }

        it "provides additional precision on #failure_message" 


        it "provides additional precision on #negative_failure_message" 

      end

      it 'fails properly when the actual is an array of multiline strings' 


      describe '#description' do
        # Ruby 1.8.7 produces a less precise output
        expected_seconds = Time.method_defined?(:nsec) ? '000000000' : '000000'

        [
            [nil, 'eq nil'],
            [true, 'eq true'],
            [false, 'eq false'],
            [:symbol, 'eq :symbol'],
            [1, 'eq 1'],
            [1.2, 'eq 1.2'],
            ['foo', 'eq "foo"'],
            [/regex/, 'eq /regex/'],
            [['foo'], 'eq ["foo"]'],
            [{:foo => :bar}, 'eq {:foo=>:bar}'],
            [Class, 'eq Class'],
            [RSpec, 'eq RSpec'],
            [Time.utc(2014, 1, 1), "eq 2014-01-01 00:00:00.#{expected_seconds} +0000"],
        ].each do |expected, expected_description|
          context "with #{expected.inspect}" do
            around { |ex| with_env_vars('TZ' => 'UTC', &ex) } if expected.is_a?(Time)

            it "is \"#{expected_description}\"" 

          end
        end

        context "with Date.new(2014, 1, 1)" do
          it "is eq to Date.new(2014, 1, 1).inspect" 

        end

        context "with Complex(1, 2)" do
          it "is eq to Complex(1, 2).inspect" 

        end

        context 'with object' do
          it 'matches with "^eq #<Object:0x[0-9a-f]*>$"' 

        end
      end
    end
  end
end

