# frozen_string_literal: true

require "helper"
require "tempfile"
require "timeout"

if SimpleCov.usable?
  describe SimpleCov::ResultMerger do
    before do
      SimpleCov::ResultMerger.clear_resultset
      File.delete(SimpleCov::ResultMerger.resultset_path) if File.exist?(SimpleCov::ResultMerger.resultset_path)
    end

    describe "with two faked coverage resultsets" do
      before do
        @resultset1 = {
          source_fixture("sample.rb") => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil],
          source_fixture("app/models/user.rb") => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
          source_fixture("app/controllers/sample_controller.rb") => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
          source_fixture("resultset1.rb") => [1, 1, 1, 1],
          source_fixture("parallel_tests.rb") => [nil, 0, nil, 0],
          source_fixture("conditionally_loaded_1.rb") => [nil, 0, 1],  # loaded only in the first resultset
        }

        @resultset2 = {
          source_fixture("sample.rb") => [1, nil, 1, 1, nil, nil, 1, 1, nil, nil],
          source_fixture("app/models/user.rb") => [nil, 1, 5, 1, nil, nil, 1, 0, nil, nil],
          source_fixture("app/controllers/sample_controller.rb") => [nil, 3, 1, nil, nil, nil, 1, 0, nil, nil],
          source_fixture("resultset2.rb") => [nil, 1, 1, nil],
          source_fixture("parallel_tests.rb") => [nil, nil, 0, 0],
          source_fixture("conditionally_loaded_2.rb") => [nil, 0, 1],  # loaded only in the second resultset
        }
      end

      # See GitHub issue #6
      it "returns an empty hash when the resultset cache file is empty" 


      # See GitHub issue #6
      it "returns an empty hash when the resultset cache file is not present" 


      context "and results generated from those" do
        before do
          system "rm #{SimpleCov::ResultMerger.resultset_path}" if File.exist?(SimpleCov::ResultMerger.resultset_path)
          @result1 = SimpleCov::Result.new(@resultset1)
          @result1.command_name = "result1"
          @result2 = SimpleCov::Result.new(@resultset2)
          @result2.command_name = "result2"
        end

        context "with stored results" do
          before do
            SimpleCov::ResultMerger.store_result(@result1)
            SimpleCov::ResultMerger.store_result(@result2)
          end

          it "has stored data in resultset_path JSON file" 


          it "returns a hash containing keys ['result1' and 'result2'] for resultset" 


          it "returns proper values for merged_result" 


          context "with second result way above the merge_timeout" do
            before do
              @result2.created_at = Time.now - 172_800 # two days ago
              SimpleCov::ResultMerger.store_result(@result2)
            end

            it "has only one result in SimpleCov::ResultMerger.results" 

          end
        end
      end
    end

    describe ".store_result" do
      it "refreshes the resultset" 


      it "persists to disk" 


      it "synchronizes writes" 

    end

    describe ".resultset" do
      it "caches" 


      it "synchronizes reads" 

    end

    describe ".synchronize_resultset" do
      it "is reentrant (i.e. doesn't block its own process)" 


      it "blocks other processes" 

    end
  end
end

