# frozen_string_literal: true

RSpec.describe RuboCop::RSpec::Example do
  include RuboCop::AST::Sexp

  def example(source)
    described_class.new(parse_source(source).ast)
  end

  it 'extracts doc string' 


  it 'extracts doc string for unimplemented examples' 


  it 'returns nil for examples without doc strings' 


  it 'extracts keywords' 


  it 'extracts implementation' 


  it 'returns node' 


  describe 'value object semantics' do
    it 'compares by value' 


    it 'can be used as a key in a hash' 


    it 'computes #hash based on class and node' 

  end
end

