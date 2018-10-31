# frozen_string_literal: true

require "helper"

if SimpleCov.usable?
  describe SimpleCov::RawCoverage do
    describe "with two faked coverage resultsets" do
      before do
        @resultset1 = {
          source_fixture("sample.rb") => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil],
          source_fixture("app/models/user.rb") => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
          source_fixture("app/controllers/sample_controller.rb") => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
          source_fixture("resultset1.rb") => [1, 1, 1, 1],
          source_fixture("parallel_tests.rb") => [nil, 0, nil, 0],
          source_fixture("conditionally_loaded_1.rb") => [nil, 0, 1],  # loaded only in the first resultset
          source_fixture("three.rb") => [nil, 1, 1],
        }

        @resultset2 = {
          source_fixture("sample.rb") => [1, nil, 1, 1, nil, nil, 1, 1, nil, nil],
          source_fixture("app/models/user.rb") => [nil, 1, 5, 1, nil, nil, 1, 0, nil, nil],
          source_fixture("app/controllers/sample_controller.rb") => [nil, 3, 1, nil, nil, nil, 1, 0, nil, nil],
          source_fixture("resultset2.rb") => [nil, 1, 1, nil],
          source_fixture("parallel_tests.rb") => [nil, nil, 0, 0],
          source_fixture("conditionally_loaded_2.rb") => [nil, 0, 1],  # loaded only in the second resultset
          source_fixture("three.rb") => [nil, 1, 4],
        }

        @resultset3 = {
          source_fixture("three.rb") => [nil, 1, 2],
        }
      end

      context "a merge" do
        subject do
          SimpleCov::RawCoverage.merge_results(@resultset1, @resultset2, @resultset3)
        end

        it "has proper results for sample.rb" 


        it "has proper results for user.rb" 


        it "has proper results for sample_controller.rb" 


        it "has proper results for resultset1.rb" 


        it "has proper results for resultset2.rb" 


        it "has proper results for parallel_tests.rb" 


        it "has proper results for conditionally_loaded_1.rb" 


        it "has proper results for conditionally_loaded_2.rb" 


        it "has proper results for three.rb" 

      end
    end

    it "merges frozen resultsets" 

  end
end

