require 'rspec/support/object_formatter'
require 'rspec/matchers/fail_matchers'

module RSpec
  module Support
    describe ObjectFormatter, ".format" do
      context 'with an array object containing other objects for which we have custom formatting' do
        let(:time)  { Time.utc(1969, 12, 31, 19, 01, 40, 101) }
        let(:formatted_time) { ObjectFormatter.format(time) }
        let(:input) { ["string", time, [3, time]] }

        it 'formats those objects within the array output, at any level of nesting' 

      end

      context "with a hash object containing other objects for which we have custom formatting" do
        let(:time)  { Time.utc(1969, 12, 31, 19, 01, 40, 101) }
        let(:formatted_time) { ObjectFormatter.format(time) }
        let(:input) { { "key" => time, time => "value", "nested" => { "key" => time } } }

        it 'formats those objects within the hash output, at any level of nesting' 

      end

      unless RUBY_VERSION == '1.8.7' # We can't count on the ordering of the hash on 1.8.7...
        context 'with a hash object' do
          let(:input) { { :c => "ccc", :a => "aaa", "b" => 'bbb' } }
          let(:expected) { '{:a=>"aaa", "b"=>"bbb", :c=>"ccc"}' }

          it 'sorts keys to ensure objects are always displayed the same way' 

        end
      end

      context 'with Time objects' do
        let(:time) { Time.utc(1969, 12, 31, 19, 01, 40, 101) }
        let(:formatted_time) { ObjectFormatter.format(time) }

        it 'produces an extended output' 

      end

      context 'with DateTime objects' do
        def with_date_loaded
          in_sub_process_if_possible do
            require 'date'
            yield
          end
        end

        let(:date_time) { DateTime.new(2000, 1, 1, 1, 1, Rational(1, 10)) }
        let(:formatted_date_time) { ObjectFormatter.format(date_time) }

        it 'formats the DateTime using inspect' 


        it 'does not require DateTime to be defined since you need to require `date` to make it available' 


        context 'when ActiveSupport is loaded' do
          it "uses a custom format to ensure the output is different when DateTimes differ" 

        end
      end

      context 'with BigDecimal objects' do
        let(:float)   { 3.3 }
        let(:decimal) { BigDecimal("3.3") }

        let(:formatted_decimal) { ObjectFormatter.format(decimal) }

        if RUBY_VERSION >= '2.4'
          it "uses Ruby's BigDecimal formatting since it is improved in 2.4+" 

        else
          it 'includes a conventional representation of the decimal' 

        end

        it 'does not require BigDecimal to be defined since you need to require `bigdecimal` to make it available' 

      end

      context 'given a delegator' do
        def with_delegate_loaded
          in_sub_process_if_possible do
            require 'delegate'
            yield
          end
        end

        let(:object) { Object.new }
        let(:delegator) do
          SimpleDelegator.new(object)
        end

        it 'includes the delegator class in the description' 


        it 'does not require Delegator to be defined' 


        context 'for a specially-formatted object' do
          let(:decimal) { BigDecimal("3.3") }
          let(:formatted_decimal) { ObjectFormatter.format(decimal) }
          let(:object) { decimal }

          it 'formats the underlying object normally' 

        end
      end

      context 'with objects that implement description' do
        RSpec::Matchers.define :matcher_with_description do
          match { true }
          description { "description" }
        end

        RSpec::Matchers.define :matcher_without_a_description do
          match { true }
          undef description
        end

        it "produces a description when a matcher object has a description" 


        it "does not produce a description unless the object is a matcher" 


        it "produces an inspected object when a matcher is missing a description" 

      end

      context 'with an object that does not respond to #class and #inspect such as BasicObject' do
        subject(:output) do
          ObjectFormatter.format(input)
        end

        let(:input) do
          if defined?(BasicObject)
            BasicObject.new
          else
            fake_basic_object_class.new
          end
        end

        let(:fake_basic_object_class) do
          Class.new do
            def self.to_s
              'BasicObject'
            end

            undef class, inspect, respond_to?
          end
        end

        if RUBY_VERSION == '1.9.2'
          it 'produces an #inspect-like output without object id' 

        else
          it "produces an output emulating MRI's #inspect-like output generated by C implementation" 

        end
      end

      context 'with a recursive array' do
        subject(:output) do
          ObjectFormatter.format(input)
        end

        let(:input) do
          array = [time]
          array << array
          array
        end

        let(:time) { Time.utc(1969, 12, 31, 19, 01, 40, 101) }

        let(:formatted_time) { ObjectFormatter.format(time) }

        it 'formats the recursive element as [...] and other elements with custom formatting' 

      end

      context 'with a recursive-key hash' do
        subject(:output) do
          ObjectFormatter.format(input)
        end

        let(:input) do
          hash = {}
          hash[hash] = time
          hash
        end

        let(:time) { Time.utc(1969, 12, 31, 19, 01, 40, 101) }

        let(:formatted_time) { ObjectFormatter.format(time) }

        it 'formats the recursive element as {...} and other elements with custom formatting' 

      end

      context 'with a recursive-value hash' do
        subject(:output) do
          ObjectFormatter.format(input)
        end

        let(:input) do
          hash = {}
          hash[time] = hash
          hash
        end

        let(:time) { Time.utc(1969, 12, 31, 19, 01, 40, 101) }

        let(:formatted_time) { ObjectFormatter.format(time) }

        it 'formats the recursive element as {...} and other elements with custom formatting' 

      end

      context 'with a non-immediate recursive array' do
        subject(:output) do
          ObjectFormatter.format(input)
        end

        let(:input) do
          array = []
          array[0] = { :recursive_array => array }
          array
        end

        it 'formats the recursive element as [...]' 

      end

      context 'with a non-immediate recursive hash' do
        subject(:output) do
          ObjectFormatter.format(input)
        end

        let(:input) do
          hash = {}
          hash[:array] = [:next_is_recursive_hash, hash]
          hash
        end

        it 'formats the recursive element as {...}' 

      end

      context 'with an array including a same collection object multiple times' do
        subject(:output) do
          ObjectFormatter.format(input)
        end

        let(:input) do
          hash = { :key => 'value' }
          [hash, hash]
        end

        it 'does not omit them' 

      end

      context 'with truncation enabled' do
        it 'produces an output of limited length' 


        it 'does not truncate shorter strings' 


        context 'with ANSI escape codes that fall on the truncate split' do
          it 'removes that escape code so terminals do not get corrupted print a partial escape code' 

        end
      end

      context 'with truncation disabled' do
        it 'does not limit the output length' 

      end
    end
  end
end

