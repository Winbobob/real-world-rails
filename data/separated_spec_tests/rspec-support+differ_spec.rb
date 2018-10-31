# encoding: utf-8
require 'spec_helper'
require 'ostruct'
require 'timeout'
require 'rspec/support/spec/string_matcher'

module RSpec
  module Support
    describe Differ do
      describe '#diff' do
        let(:differ) { RSpec::Support::Differ.new }

        it "outputs unified diff of two strings" 


        it "outputs unified diff of two strings when used multiple times" 


        it 'does not mutate any instance variables when diffing, so we can reason about it being reused' 


        def differ_ivars
          Hash[ differ.instance_variables.map do |ivar|
            [ivar, differ.instance_variable_get(ivar)]
          end ]
        end

        if String.method_defined?(:encoding)

          it "returns an empty string if strings are not multiline" 


          it 'copes with encoded strings', :skip => RSpec::Support::OS.windows? do
            expected = "Tu avec carte {count} item has\n".encode('UTF-16LE')
            actual   = "Tu avec carté {count} itém has\n".encode('UTF-16LE')
            expected_diff = <<-EOD.encode('UTF-16LE')

@@ -1,2 +1,2 @@
-Tu avec carte {count} item has
+Tu avec carté {count} itém has
EOD

            diff = differ.diff(actual, expected)
            expect(diff).to be_diffed_as(expected_diff)
          end

          it 'handles differently encoded strings that are compatible' 


          it 'uses the default external encoding when the two strings have incompatible encodings', :failing_on_appveyor do
            expected = "Tu avec carte {count} item has\n"
            actual   = "Tu avec carté {count} itém has\n".encode('UTF-16LE')
            expected_diff = "\n@@ -1,2 +1,2 @@\n-Tu avec carte {count} item has\n+Tu avec carté {count} itém has\n"

            diff = differ.diff(actual, expected)
            expect(diff).to be_diffed_as(expected_diff)
            expect(diff.encoding).to eq(Encoding.default_external)
          end

          it 'handles any encoding error that occurs with a helpful error message' 

        end

        it "outputs unified diff message of two objects" 


        it "outputs unified diff message of two arrays" 


        it 'outputs a unified diff message for an array which flatten recurses' 


        it "outputs unified diff message of two hashes" 


        unless RUBY_VERSION == '1.8.7' # We can't count on the ordering of the hash on 1.8.7...
          it "outputs unified diff message for hashes inside arrays with differing key orders" 

        end

        it 'outputs unified diff message of two hashes with differing encoding', :failing_on_appveyor do
          expected_diff = %Q{
@@ -1,2 +1,2 @@
-"a" => "a",
#{ (RUBY_VERSION.to_f > 1.8) ?  %Q{+"ö" => "ö"} : '+"\303\266" => "\303\266"' },
}

          diff = differ.diff({'ö' => 'ö'}, {'a' => 'a'})
          expect(diff).to be_diffed_as(expected_diff)
        end

        it 'outputs unified diff message of two hashes with encoding different to key encoding', :failing_on_appveyor do
          expected_diff = %Q{
@@ -1,2 +1,2 @@
-:a => "a",
#{ (RUBY_VERSION.to_f > 1.8) ?  %Q{+\"한글\" => \"한글2\"} : '+"\355\225\234\352\270\200" => "\355\225\234\352\270\2002"' },
}

          diff = differ.diff({ "한글" => "한글2"}, { :a => "a"})
          expect(diff).to be_diffed_as(expected_diff)
        end

        it "outputs unified diff message of two hashes with object keys" 


      context 'when special-case objects are inside hashes' do
        let(:time) { Time.utc(1969, 12, 31, 19, 01, 40, 101) }
        let(:formatted_time) { ObjectFormatter.format(time) }

        it "outputs unified diff message of two hashes with Time object keys" 


        it "outputs unified diff message of two hashes with hashes inside them" 

      end

      context 'when special-case objects are inside arrays' do
        let(:time) { Time.utc(1969, 12, 31, 19, 01, 40, 101) }
        let(:formatted_time) { ObjectFormatter.format(time) }

        it "outputs unified diff message of two arrays with Time object keys" 


        it "outputs unified diff message of two arrays with hashes inside them" 

      end

        it "outputs unified diff of multi line strings" 


        it "splits items with newlines" 


        it "shows inner arrays on a single line" 


        it "returns an empty string if no expected or actual" 


        it "returns an empty string if expected is Numeric" 


        it "returns an empty string if actual is Numeric" 


        it "returns an empty string if expected or actual are procs" 


        it "returns a String if no diff is returned" 


        it "returns a String if a diff is performed" 


        it "includes object delegation information in the diff output" 


        context "with :object_preparer option set" do
          let(:differ) do
            RSpec::Support::Differ.new(:object_preparer => lambda { |s| s.to_s.reverse })
          end

          it "uses the output of object_preparer for diffing" 

        end

        context "with :color option set" do
          let(:differ) { RSpec::Support::Differ.new(:color => true) }

          it "outputs colored diffs" 

        end
      end
    end
  end
end

