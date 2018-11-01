# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceInsideBlockBraces, :config do
  SUPPORTED_STYLES = %w[space no_space].freeze

  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    {
      'EnforcedStyle' => 'space',
      'SupportedStyles' => SUPPORTED_STYLES,
      'SpaceBeforeBlockParameters' => true
    }
  end

  context 'with space inside empty braces not allowed' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBraces' => 'no_space' } }

    it 'accepts empty braces with no space inside' 


    it 'accepts braces with something inside' 


    it 'accepts multiline braces with content' 


    it 'accepts empty braces with comment and line break inside' 


    it 'registers an offense for empty braces with line break inside' 


    it 'registers an offense for empty braces with space inside' 


    it 'auto-corrects unwanted space' 


    it 'does not auto-correct when braces are not empty' 

  end

  context 'with space inside empty braces allowed' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBraces' => 'space' } }

    it 'accepts empty braces with space inside' 


    it 'registers an offense for empty braces with no space inside' 


    it 'auto-corrects missing space' 

  end

  context 'with invalid value for EnforcedStyleForEmptyBraces' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBraces' => 'unknown' } }

    it 'fails with an error' 

  end

  it 'accepts braces surrounded by spaces' 


  it 'accepts left brace without outer space' 


  it 'registers an offense for left brace without inner space' 


  it 'registers an offense for right brace without inner space' 


  it 'registers offenses for both braces without inner space' 


  it 'auto-corrects missing space' 


  context 'with passed in parameters' do
    context 'for single-line blocks' do
      it 'accepts left brace with inner space' 


      it 'registers an offense for left brace without inner space' 

    end

    context 'for multi-line blocks' do
      it 'accepts left brace with inner space' 


      it 'registers an offense for left brace without inner space' 


      it 'auto-corrects missing space' 

    end

    it 'accepts new lambda syntax' 


    it 'auto-corrects missing space' 


    context 'and BlockDelimiters cop enabled' do
      let(:config) do
        RuboCop::Config.new('Style/BlockDelimiters' => { 'Enabled' => true },
                            'Layout/SpaceInsideBlockBraces' => cop_config)
      end

      it 'does auto-correction for single-line blocks' 


      it 'does auto-correction for multi-line blocks' 

    end

    context 'and space before block parameters not allowed' do
      let(:cop_config) do
        {
          'EnforcedStyle' => 'space',
          'SupportedStyles' => SUPPORTED_STYLES,
          'SpaceBeforeBlockParameters' => false
        }
      end

      it 'registers an offense for left brace with inner space' 


      it 'accepts new lambda syntax' 


      it 'auto-corrects unwanted space' 


      it 'accepts left brace without inner space' 

    end
  end

  context 'configured with no_space' do
    let(:cop_config) do
      {
        'EnforcedStyle' => 'no_space',
        'SupportedStyles' => SUPPORTED_STYLES,
        'SpaceBeforeBlockParameters' => true
      }
    end

    it 'accepts braces without spaces inside' 


    it 'registers an offense for left brace with inner space' 


    it 'registers an offense for right brace with inner space' 


    it 'accepts left brace without outer space' 


    it 'auto-corrects unwanted space' 


    context 'with passed in parameters' do
      context 'and space before block parameters allowed' do
        it 'accepts left brace with inner space' 


        it 'registers an offense for left brace without inner space' 


        it 'accepts new lambda syntax' 


        it 'auto-corrects missing space' 

      end

      context 'and space before block parameters not allowed' do
        let(:cop_config) do
          {
            'EnforcedStyle' => 'no_space',
            'SupportedStyles' => SUPPORTED_STYLES,
            'SpaceBeforeBlockParameters' => false
          }
        end

        it 'registers an offense for left brace with inner space' 


        it 'accepts new lambda syntax' 


        it 'auto-corrects unwanted space' 

      end
    end
  end
end

