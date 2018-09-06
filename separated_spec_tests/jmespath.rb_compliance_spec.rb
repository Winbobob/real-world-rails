require 'spec_helper'

describe 'Compliance' do
  Dir.glob('spec/{compliance,legacy}/*.json').each do |path|

    test_file = File.basename(path).split('.').first
    next if test_file == 'benchmarks'
    next if ENV['TEST_FILE'] && ENV['TEST_FILE'] != test_file

    describe(test_file) do
      JMESPath.load_json(path).each do |scenario|
        describe("Given #{scenario['given'].to_json}") do
          scenario['cases'].each do |test_case|

            if test_case['error']

              it "the expression #{test_case['expression'].inspect} raises a #{test_case['error']} error" 


            else

              it "searching #{test_case['expression'].inspect} returns #{test_case['result'].to_json}" 


            end
          end
        end
      end
    end
  end
end

