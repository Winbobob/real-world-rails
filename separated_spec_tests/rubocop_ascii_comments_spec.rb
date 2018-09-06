# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::AsciiComments do
  subject(:cop) { described_class.new }

  it 'registers an offense for a comment with non-ascii chars' 


  it 'registers an offense for comments with mixed chars' 


  it 'accepts comments with only ascii chars' 


  context 'when certain non-ascii chars are allowed', :config do
    subject(:cop) { described_class.new(config) }

    let(:cop_config) { { 'AllowedChars' => ['∂'] } }

    it 'accepts comment with allowed non-ascii chars' 


    it 'registers an offense for comments with non-allowed non-ascii chars' 

  end
end

