# frozen_string_literal: true

require "helper"

if SimpleCov.usable?
  describe SimpleCov::Result do
    subject do
      original_result = {
        source_fixture("sample.rb") => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil],
        source_fixture("app/models/user.rb") => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
        source_fixture("app/controllers/sample_controller.rb") => [nil, 2, 2, 0, nil, nil, 0, nil, nil, nil],
      }
      SimpleCov::Result.new(original_result).files
    end

    it "has 11 covered lines" 


    it "has 3 missed lines" 


    it "has 17 never lines" 


    it "has 14 lines of code" 


    it "has 5 skipped lines" 


    it "has the correct covered percent" 


    it "has the correct covered percentages" 


    it "has the correct least covered file" 


    it "has the correct covered strength" 

  end
end

