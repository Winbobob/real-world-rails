# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::ParameterLists, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    {
      'Max' => 4,
      'CountKeywordArgs' => true
    }
  end

  it 'registers an offense for a method def with 5 parameters' 


  it 'accepts a method def with 4 parameters' 


  it 'accepts a proc with more than 4 parameters' 


  it 'accepts a lambda with more than 4 parameters' 


  context 'When CountKeywordArgs is true' do
    it 'counts keyword arguments as well' 

  end

  context 'When CountKeywordArgs is false' do
    before { cop_config['CountKeywordArgs'] = false }

    it 'does not count keyword arguments' 


    it 'does not count keyword arguments without default values' 

  end
end

