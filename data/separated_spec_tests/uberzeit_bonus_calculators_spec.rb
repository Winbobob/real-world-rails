require 'spec_helper'

describe UberZeit::BonusCalculators do

  let(:my_calculator) { Class.new { def initialize(args); end } }

  it 'allows to register a new calculator' 


  describe '.use' do
    before do
      UberZeit::BonusCalculators.register :my_calc, my_calculator
    end

    it 'returns the specified registered calculator' 


    it 'returns a dummy calculator if the requested calculator is nil' 

    it 'returns a dummy calculator if the requested calculator is an empty string' 

  end

end

