# frozen_string_literal: true

require "helper"

if SimpleCov.usable?
  describe "result" do
    context "with a (mocked) Coverage.result" do
      before do
        @prev_filters = SimpleCov.filters
        SimpleCov.filters = []
        @prev_groups = SimpleCov.groups
        SimpleCov.groups = {}
        @prev_formatter = SimpleCov.formatter
        SimpleCov.formatter = nil
      end

      after do
        SimpleCov.filters   = @prev_filters
        SimpleCov.groups    = @prev_groups
        SimpleCov.formatter = @prev_formatter
      end

      let(:original_result) do
        {
          source_fixture("sample.rb") => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil],
          source_fixture("app/models/user.rb") => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
          source_fixture("app/controllers/sample_controller.rb") => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
        }
      end

      context "a simple cov result initialized from that" do
        subject { SimpleCov::Result.new(original_result) }

        it "has 3 filenames" 


        it "has 3 source files" 


        it "returns an instance of SimpleCov::FileList for source_files and files" 


        it "has files equal to source_files" 


        it "has accurate covered percent" 


        it "has accurate covered percentages" 


        it "has accurate least covered file" 


        [:covered_percent, :covered_percentages, :least_covered_file, :covered_strength, :covered_lines, :missed_lines, :total_lines].each do |msg|
          it "responds to #{msg}" 

        end

        context "dumped with to_hash" do
          it "is a hash" 


          context "loaded back with from_hash" do
            let(:dumped_result) do
              SimpleCov::Result.from_hash(subject.to_hash)
            end

            it "has 3 source files" 


            it "has the same covered_percent" 


            it "has the same covered_percentages" 


            it "has the same timestamp" 


            it "has the same command_name" 


            it "has the same original_result" 

          end
        end
      end

      context "with some filters set up" do
        before do
          SimpleCov.add_filter "sample.rb"
        end

        it "has 2 files in a new simple cov result" 


        it "has 80 covered percent" 


        it "has [80.0, 80.0] covered percentages" 

      end

      context "with groups set up for all files" do
        before do
          SimpleCov.add_group "Models", "app/models"
          SimpleCov.add_group "Controllers", ["app/controllers"]
          SimpleCov.add_group "Other" do |src_file|
            File.basename(src_file.filename) == "sample.rb"
          end
        end

        subject do
          SimpleCov::Result.new(original_result)
        end

        it "has 3 groups" 


        it "has user.rb in 'Models' group" 


        it "has sample_controller.rb in 'Controllers' group" 


        context "and simple formatter being used" do
          before do
            SimpleCov.formatter = SimpleCov::Formatter::SimpleFormatter
          end

          it "returns a formatted string with result.format!" 

        end

        context "and multi formatter being used" do
          before do
            SimpleCov.formatters = [
              SimpleCov::Formatter::SimpleFormatter,
              SimpleCov::Formatter::SimpleFormatter,
            ]
          end

          it "returns an array containing formatted string with result.format!" 

        end
      end

      context "with groups set up that do not match all files" do
        before do
          SimpleCov.configure do
            add_group "Models", "app/models"
            add_group "Controllers", "app/controllers"
          end
        end

        subject { SimpleCov::Result.new(original_result) }

        it "has 3 groups" 


        it "has 1 item per group" 


        it 'has sample.rb in "Ungrouped" group' 


        it "returns all groups as instances of SimpleCov::FileList" 

      end
    end
  end
end

