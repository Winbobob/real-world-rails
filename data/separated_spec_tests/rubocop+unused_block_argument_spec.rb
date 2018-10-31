# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UnusedBlockArgument, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'AllowUnusedKeywordArguments' => false } }

  shared_examples 'auto-correction' do |name, old_source, new_source|
    it "auto-corrects #{name}" 

  end

  context 'inspection' do
    context 'when a block takes multiple arguments' do
      context 'and an argument is unused' do
        it 'registers an offense' 

      end

      context 'and arguments are swap-assigned' do
        it 'accepts' 

      end

      context "and one argument is assigned to another, whilst other's value " \
                'is not used' do
        it 'registers an offense' 

      end

      context 'and all the arguments are unused' do
        it 'registers offenses and suggests omitting them' 

      end
    end

    context 'when a block takes single argument' do
      context 'and the argument is unused' do
        it 'registers an offense and suggests omitting that' 

      end

      context 'and the method call is `define_method`' do
        it 'registers an offense' 

      end
    end

    context 'when a block have a block local variable' do
      context 'and the variable is unused' do
        it 'registers an offense' 

      end
    end

    context 'when a lambda block takes arguments' do
      context 'and all the arguments are unused' do
        it 'registers offenses and suggests using a proc' 

      end

      context 'and an argument is unused' do
        it 'registers an offense' 

      end
    end

    context 'when an underscore-prefixed block argument is not used' do
      it 'accepts' 

    end

    context 'when an optional keyword argument is unused' do
      context 'when the method call is `define_method`' do
        it 'registers an offense' 


        context 'when AllowUnusedKeywordArguments set' do
          let(:cop_config) { { 'AllowUnusedKeywordArguments' => true } }

          it 'does not care' 

        end
      end

      context 'when the method call is not `define_method`' do
        it 'registers an offense' 


        context 'when AllowUnusedKeywordArguments set' do
          let(:cop_config) { { 'AllowUnusedKeywordArguments' => true } }

          it 'does not care' 

        end
      end
    end

    context 'when a method argument is not used' do
      it 'does not care' 

    end

    context 'when a variable is not used' do
      it 'does not care' 

    end

    context 'in a method calling `binding` without arguments' do
      it 'accepts all arguments' 


      context 'inside a method definition' do
        it 'registers offenses' 

      end
    end

    context 'in a method calling `binding` with arguments' do
      context 'when a method argument is unused' do
        it 'registers an offense' 

      end
    end

    context 'with an empty block' do
      context 'when not configured to ignore empty blocks' do
        let(:cop_config) { { 'IgnoreEmptyBlocks' => false } }

        it 'registers an offense' 

      end

      context 'when configured to ignore empty blocks' do
        let(:cop_config) { { 'IgnoreEmptyBlocks' => true } }

        it 'does not register an offense' 

      end
    end
  end

  context 'auto-correct' do
    it_behaves_like(
      'auto-correction',
      'fixes single',
      'arr.map { |foo| stuff }',
      'arr.map { |_foo| stuff }'
    )

    it_behaves_like(
      'auto-correction',
      'fixes multiple',
      'hash.map { |key, val| stuff }',
      'hash.map { |_key, _val| stuff }'
    )

    it_behaves_like(
      'auto-correction',
      'preserves whitespace',
      <<-SOURCE,
        hash.map { |key,
                    val| stuff }
      SOURCE
      <<-CORRECTED_SOURCE
        hash.map { |_key,
                    _val| stuff }
      CORRECTED_SOURCE
    )

    it_behaves_like(
      'auto-correction',
      'preserves splat',
      'obj.method { |foo, *bars, baz| stuff(foo, baz) }',
      'obj.method { |foo, *_bars, baz| stuff(foo, baz) }'
    )

    it_behaves_like(
      'auto-correction',
      'preserves default',
      'obj.method { |foo, bar = baz| stuff(foo) }',
      'obj.method { |foo, _bar = baz| stuff(foo) }'
    )

    it 'ignores used arguments' 

  end

  context 'when IgnoreEmptyBlocks config parameter is set' do
    let(:cop_config) { { 'IgnoreEmptyBlocks' => true } }

    it 'accepts an empty block with a single unused parameter' 


    it 'registers an offense for a non-empty block with an unused parameter' 


    it 'accepts an empty block with multiple unused parameters' 


    it 'registers an offense for a non-empty block with multiple unused args' 

  end
end

