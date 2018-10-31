# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UselessComparison do
  subject(:cop) { described_class.new }

  described_class::OPS.each do |op|
    it "registers an offense for a simple comparison with #{op}" 


    it "registers an offense for a complex comparison with #{op}" 

  end

  it 'works with lambda.()' 

end

