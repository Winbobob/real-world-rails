# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UnneededSplatExpansion do
  subject(:cop) { described_class.new }

  let(:message) { 'Unnecessary splat expansion.' }
  let(:array_param_message) { 'Pass array contents as separate arguments.' }

  it 'allows assigning to a splat' 


  it 'allows assigning to a splat variable' 


  it 'allows assigning a variable to a splat expansion of a variable' 


  it 'allows assigning to an expanded range' 


  it 'allows splat expansion inside of an array' 


  it 'accepts expanding a variable as a method parameter' 


  shared_examples 'splat literal assignment' do |literal|
    it 'registers an offense for ' 

  end

  shared_examples 'array splat expansion' do |literal|
    context 'method parameters' do
      it 'registers an offense' 

    end

    it_behaves_like 'splat literal assignment', literal
  end

  shared_examples 'splat expansion' do |literal|
    context 'method parameters' do
      it 'registers an offense' 

    end

    it_behaves_like 'splat literal assignment', literal
  end

  it_behaves_like 'array splat expansion', '[1, 2, 3]'
  it_behaves_like 'array splat expansion', '%w(one two three)'
  it_behaves_like 'array splat expansion', '%W(one #{two} three)'
  it_behaves_like 'splat expansion', "'a'"
  it_behaves_like 'splat expansion', '"#{a}"'
  it_behaves_like 'splat expansion', '1'
  it_behaves_like 'splat expansion', '1.1'

  context 'assignment to splat expansion' do
    it 'registers an offense for an array using a constructor' 

  end

  context 'expanding an array literal in a when condition' do
    it 'registers an offense for an array using []' 


    it 'registers an offense for an array using %w' 


    it 'registers an offense for an array using %W' 


    it 'allows an array that is assigned to a variable' 


    it 'allows an array using a constructor' 

  end

  it 'registers an offense for an array literal being expanded in a rescue' 


  it 'allows expansions of an array that is assigned to a variable in rescue' 


  it 'allows an array using a constructor' 


  it 'registers an offense for the expansion of an array literal' \
    'inside of an array literal' do
    inspect_source('[1, 2, *[3, 4, 5], 6, 7]')

    expect(cop.messages).to eq([array_param_message])
    expect(cop.highlights).to eq(['*[3, 4, 5]'])
  end

  it 'allows expanding a method call on an array literal' 


  describe 'expanding Array.new call on array literal' do
    context 'when the array literal contains exactly one element' do
      it 'registers an offense' 

    end

    context 'when the array literal contains more than one element' do
      it 'accepts' 

    end
  end

  context 'autocorrect' do
    context 'assignment to a splat expanded variable' do
      it 'removes the splat from an array using []' 


      it 'removes the splat from an array using %w' 


      it 'removes the splat from an array using %W' 


      it 'converts an expanded string to an array' 


      it 'converts an expanded string with interpolation to an array' 


      it 'converts an expanded integer to an array' 


      it 'converts an expanded float to an array' 

    end

    context 'splat expansion in when condition' do
      it 'removes the square brackets' 


      it 'changes %w to a list of words' 


      it 'changes %W to a list of words' 

    end

    context 'rescuing splat expansion' do
      it 'changes an array literal to a list of constants' 

    end

    context 'splat expansion of method parameters' do
      it 'removes the splat and brackets from []' 


      it 'changes %w to a list of words' 


      it 'changes %W to a list of words' 

    end

    context 'splat expansion inside of an array' do
      it 'removes the splat and brackets from []' 


      it 'changes %w to a list of words' 


      it 'changes %W to a list of words' 

    end
  end

  it_behaves_like 'array splat expansion', '%i(first second)'
  it_behaves_like 'array splat expansion', '%I(first second #{third})'

  context 'arrays being expanded with %i variants using splat expansion' do
    it 'registers an offense for an array literal being expanded in a ' \
      'when condition' do
      inspect_source(<<-'RUBY'.strip_indent)
        case foo
        when *%i(first second)
          bar
        when *%I(#{first} second)
          baz
        end
      RUBY

      expect(cop.offenses.size).to eq(2)
      expect(cop.highlights).to eq(['*%i(first second)',
                                    '*%I(#{first} second)'])
    end

    context 'splat expansion of method parameters' do
      it 'registers an offense for an array literal %i' 


      it 'registers an offense for an array literal %I' 

    end

    context 'autocorrect' do
      it 'changes %i to a list of symbols' 


      it 'changes %I to a list of symbols' 

    end

    context 'splat expansion inside of an array' do
      it 'changes %i to a list of symbols' 


      it 'changes %I to a list of symbols' 


      context 'when Array.new is expanded' do
        context 'and the array contains exactly one element' do
          it 'removes the splat and brackets' 

        end
      end
    end
  end
end

