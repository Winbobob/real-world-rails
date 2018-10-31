# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceBeforeSemicolon do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/SpaceInsideBlockBraces' => brace_config)
  end
  let(:brace_config) { {} }

  it 'registers an offense for space before semicolon' 


  it 'does not register an offense for no space before semicolons' 


  it 'auto-corrects space before semicolon' 


  it 'handles more than one space before a semicolon' 


  context 'inside block braces' do
    shared_examples 'common behavior' do
      it 'accepts no space between an opening brace and a semicolon' 

    end

    context 'when EnforcedStyle for SpaceInsideBlockBraces is space' do
      let(:brace_config) do
        { 'Enabled' => true, 'EnforcedStyle' => 'space' }
      end

      it_behaves_like 'common behavior'

      it 'accepts a space between an opening brace and a semicolon' 

    end

    context 'when EnforcedStyle for SpaceInsideBlockBraces is no_space' do
      let(:brace_config) do
        { 'Enabled' => true, 'EnforcedStyle' => 'no_space' }
      end

      it_behaves_like 'common behavior'

      it 'registers an offense for a space between an opening brace and a ' \
         'semicolon' do
        inspect_source('test { ; }')
        expect(cop.messages).to eq(['Space found before semicolon.'])
      end
    end
  end
end

