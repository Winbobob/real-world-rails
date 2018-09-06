# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::Semicolon, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'AllowAsExpressionSeparator' => false } }

  it 'registers an offense for a single expression' 


  it 'registers an offense for several expressions' 


  it 'registers an offense for one line method with two statements' 


  it 'accepts semicolon before end if so configured' 


  it 'accepts semicolon after params if so configured' 


  it 'accepts one line method definitions' 


  it 'accepts one line empty class definitions' 


  it 'accepts one line empty method definitions' 


  it 'accepts one line empty module definitions' 


  it 'registers an offense for semicolon at the end no matter what' 


  it 'accept semicolons inside strings' 


  it 'registers an offense for a semicolon at the beginning of a line' 


  it 'auto-corrects semicolons when syntactically possible' 


  context 'when AllowAsExpressionSeparator is true' do
    let(:cop_config) { { 'AllowAsExpressionSeparator' => true } }

    it 'accepts several expressions' 


    it 'accepts one line method with two statements' 

  end
end

