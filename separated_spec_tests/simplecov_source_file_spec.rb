# frozen_string_literal: true

require "helper"

if SimpleCov.usable?
  describe SimpleCov::SourceFile do
    COVERAGE_FOR_SAMPLE_RB = [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil, nil, nil, nil, nil, nil, nil].freeze
    context "a source file initialized with some coverage data" do
      subject do
        SimpleCov::SourceFile.new(source_fixture("sample.rb"), COVERAGE_FOR_SAMPLE_RB)
      end

      it "has a filename" 


      it "has source equal to src" 


      it "has a project filename which removes the project directory" 


      it "has source_lines equal to lines" 


      it "has 16 source lines" 


      it "has all source lines of type SimpleCov::SourceFile::Line" 


      it "has 'class Foo' as line(2).source" 


      it "returns lines number 2, 3, 4, 7 for covered_lines" 


      it "returns lines number 8 for missed_lines" 


      it "returns lines number 1, 5, 6, 9, 10, 16 for never_lines" 


      it "returns line numbers 11, 12, 13, 14, 15 for skipped_lines" 


      it "has 80% covered_percent" 

    end

    context "simulating potential Ruby 1.9 defect -- see Issue #56" do
      subject do
        SimpleCov::SourceFile.new(source_fixture("sample.rb"), COVERAGE_FOR_SAMPLE_RB + [nil])
      end

      it "has 16 source lines regardless of extra data in coverage array" 


      it "prints a warning to stderr if coverage array contains more data than lines in the file" 

    end

    context "a file that is never relevant" do
      COVERAGE_FOR_NEVER_RB = [nil, nil].freeze

      subject do
        SimpleCov::SourceFile.new(source_fixture("never.rb"), COVERAGE_FOR_NEVER_RB)
      end

      it "has 0.0 covered_strength" 


      it "has 0.0 covered_percent" 

    end

    context "a file where nothing is ever executed mixed with skipping #563" do
      COVERAGE_FOR_SKIPPED_RB = [nil, nil, nil, nil].freeze

      subject do
        SimpleCov::SourceFile.new(source_fixture("skipped.rb"), COVERAGE_FOR_SKIPPED_RB)
      end

      it "has 0.0 covered_strength" 


      it "has 0.0 covered_percent" 

    end

    context "a file where everything is skipped and missed #563" do
      COVERAGE_FOR_SKIPPED_RB_2 = [nil, nil, 0, nil].freeze

      subject do
        SimpleCov::SourceFile.new(source_fixture("skipped.rb"), COVERAGE_FOR_SKIPPED_RB_2)
      end

      it "has 0.0 covered_strength" 


      it "has 0.0 covered_percent" 

    end

    context "a file where everything is skipped/irrelevamt but executed #563" do
      COVERAGE_FOR_SKIPPED_AND_EXECUTED_RB = [nil, nil, 1, 1, 0, nil, nil, nil].freeze

      subject do
        SimpleCov::SourceFile.new(source_fixture("skipped_and_executed.rb"), COVERAGE_FOR_SKIPPED_AND_EXECUTED_RB)
      end

      it "has 0.0 covered_strength" 


      it "has 0.0 covered_percent" 

    end
  end
end

