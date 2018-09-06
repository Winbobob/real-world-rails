require 'spec_helper'
require 'parallel_tests/grouper'
require 'parallel_tests/cucumber/scenarios'
require 'tmpdir'

describe ParallelTests::Grouper do
  describe '.by_steps' do
    def write(file, content)
      File.open(file,'w'){|f| f.write content }
    end

    it "sorts features by steps" 

  end

  describe '.in_even_groups_by_size' do
    let(:files_with_size){ {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5} }

    def call(num_groups, options={})
      ParallelTests::Grouper.in_even_groups_by_size(files_with_size, num_groups, options)
    end

    it "groups 1 by 1 for same groups as size" 


    it "groups into even groups" 


    it "groups into a single group" 


    it "adds empty groups if there are more groups than feature files" 


    it "groups single items into first group" 


    it "groups single items with others if there are too few" 

  end

  describe '.by_scenarios' do
    let(:feature_file) { double 'file' }

    it 'splits a feature into individual scenarios' 

  end
end

