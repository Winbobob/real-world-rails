# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::ClassLength, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Max' => 5, 'CountComments' => false } }

  it 'rejects a class with more than 5 lines' 


  it 'reports the correct beginning and end lines' 


  it 'accepts a class with 5 lines' 


  it 'accepts a class with less than 5 lines' 


  it 'does not count blank lines' 


  it 'accepts empty classes' 


  context 'when a class has inner classes' do
    it 'does not count lines of inner classes' 


    it 'rejects a class with 6 lines that belong to the class directly' 

  end

  context 'when CountComments is enabled' do
    before { cop_config['CountComments'] = true }

    it 'also counts commented lines' 

  end

  context 'when inspecting a class defined with Class.new' do
    it 'registers an offense' 

  end
end

