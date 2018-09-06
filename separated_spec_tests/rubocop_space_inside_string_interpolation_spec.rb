# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceInsideStringInterpolation, :config do
  subject(:cop) { described_class.new(config) }

  let(:irregular_source) do
    ['"#{ var}"',
     '"#{var }"',
     '"#{   var   }"',
     '"#{var	}"',
     '"#{	var	}"',
     '"#{	var}"',
     '"#{ 	 var 	 	}"']
  end

  shared_examples 'ill-formatted string interpolations' do
    let(:source_length) { source.class == String ? 1 : source.length }

    it 'registers an offense for any irregular spacing inside the braces' 


    it 'auto-corrects spacing within a string interpolation' 

  end

  context 'when EnforcedStyle is no_space' do
    let(:cop_config) { { 'EnforcedStyle' => 'no_space' } }
    let(:expected_message) do
      'Space inside string interpolation detected.'
    end

    context 'for always ill-formatted string interpolations' do
      let(:source) { irregular_source }
      let(:corrected_source) { '"#{var}"' }

      it_behaves_like 'ill-formatted string interpolations'
    end

    context 'for "space" style formatted string interpolations' do
      let(:source) { '"#{ var }"' }
      let(:corrected_source) { '"#{var}"' }

      it_behaves_like 'ill-formatted string interpolations'
    end

    context 'for well-formatted string interpolations' do
      let(:source) do
        ['"Variable is    #{var}      "',
         '"  Variable is  #{var}"']
      end

      it 'does not register an offense for excess literal spacing' 


      it 'does not correct valid string interpolations' 

    end

    it 'accepts empty interpolation' 

  end

  context 'when EnforcedStyle is space' do
    let(:cop_config) { { 'EnforcedStyle' => 'space' } }
    let(:expected_message) do
      'Missing space around string interpolation detected.'
    end

    context 'for always ill-formatted string interpolations' do
      let(:source) { irregular_source }
      let(:corrected_source) { '"#{ var }"' }

      it_behaves_like 'ill-formatted string interpolations'
    end

    context 'for "no_space" style formatted string interpolations' do
      let(:source) { '"#{var}"' }
      let(:corrected_source) { '"#{ var }"' }

      it_behaves_like 'ill-formatted string interpolations'
    end

    context 'for well-formatted string interpolations' do
      let(:source) do
        ['"Variable is    #{ var }      "',
         '"  Variable is  #{ var }"']
      end

      it 'does not register an offense for excess literal spacing' 


      it 'does not correct valid string interpolations' 

    end

    it 'accepts empty interpolation' 

  end
end

