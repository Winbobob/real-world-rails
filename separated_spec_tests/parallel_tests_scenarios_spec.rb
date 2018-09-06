require 'tempfile'
require 'parallel_tests/cucumber/scenarios'

describe ParallelTests::Cucumber::Scenarios do

  let(:feature_file) do
    Tempfile.new('grouper.feature').tap do |feature|
      feature.write <<-EOS
          Feature: Grouping by scenario

            Scenario: First
              Given I do nothing

            Scenario: Second
              Given I don't do anything

            Scenario Outline: Third
              Given I don't do anything
            Examples:
              | param   |
              | value 1 |
              | value 2 |
      EOS
      feature.rewind
    end
  end


  context 'by default' do
    it 'returns all the scenarios' 

  end

  context 'with line numbers' do
    it 'only returns scenarios that match the provided lines' 

  end

  context 'with tags' do
    let(:feature_file) do
      Tempfile.new('grouper.feature').tap do |feature|
        feature.write <<-EOS
          @colours
          Feature: Grouping by scenario

            @black
            Scenario: Black
              Given I am black

            @white
            Scenario: White
              Given I am blue

            @black @white
            Scenario: Gray
              Given I am Gray

            @red
            Scenario Outline: Red
              Give I am <colour>
              @blue
              Examples:
                | colour  |
                | magenta |
                | fuschia |

              @green
              Examples:
                | colour |
                | yellow |

              @blue @green
              Examples:
               | colour |
               | white  |
        EOS
        feature.rewind
      end
    end

    it 'Singe Feature Tag: colours' 


    it 'Single Scenario Tag: white' 


    it 'Multiple Scenario Tags 1: black && white' 


    it 'Multiple Scenario Tags 2: black || white scenarios' 


    it 'Scenario Outline Tag: red' 


    it 'Example Tag: blue' 


    it 'Multiple Example Tags 1: blue && green' 


    it 'Multiple Example Tags 2: blue || green' 


    it 'Single Negative Feature Tag: !colours' 


    it 'Single Negative Scenario Tag: !black' 


    it 'Multiple Negative Scenario Tags And: !black || !white' 


    it 'Multiple Negative Scenario Tags Or: !(black && white)' 


    it 'Negative Scenario Outline Tag: !red' 


    it 'Negative Example Tag: !blue' 


    it 'Multiple Negative Example Tags 1: !blue || !green' 


    it 'Multiple Negative Example Tags 2: !(blue && green) ' 


    it 'Scenario and Example Mixed Tags: black || green' 


    it 'Positive and Negative Mixed Tags: red && !blue' 


    it 'Ignore Tag Pattern Feature: colours' 


    it 'Ignore Tag Pattern Scenario: black' 


    it 'Ignore Tag Pattern Scenario Outline: red' 


    it 'Ignore Tag Pattern Example: green' 


    it 'Ignore Tag Pattern Multiple Tags: black || red' 

  end
end

