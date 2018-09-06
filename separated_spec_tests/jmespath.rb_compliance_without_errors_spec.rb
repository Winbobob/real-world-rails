require 'spec_helper'

describe 'Compliance' do
  PARSER = JMESPath::Parser.new(:disable_visit_errors => true)
  Dir.glob('spec/compliance/*.json').each do |path|
    describe(File.basename(path).split('.').first) do
      JMESPath.load_json(path).each do |scenario|
        describe("Given #{scenario['given'].inspect}") do
          scenario['cases'].each do |test_case|

            if test_case['error']

              if %w[invalid-type invalid-arity].include?(test_case['error'])
                it "the expression #{test_case['expression'].inspect} returns nil if disable_visit_errors is true" 

              else
                it "the expression #{test_case['expression'].inspect} raises a #{test_case['error']} error when parsing even if disable_visit_errors is true" 

              end
            end
          end
        end
      end
    end
  end
end

