# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RedundantReturn, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'AllowMultipleReturnValues' => false } }

  it 'reports an offense for def with only a return' 


  it 'reports an offense for defs with only a return' 


  it 'reports an offense for def ending with return' 


  it 'reports an offense for defs ending with return' 


  it 'accepts return in a non-final position' 


  it 'does not blow up on empty method body' 


  it 'does not blow up on empty if body' 


  it 'auto-corrects by removing redundant returns' 


  context 'when return has no arguments' do
    shared_examples 'common behavior' do |ret|
      let(:src) do
        <<-RUBY.strip_indent
          def func
            one
            two
            #{ret}
            # comment
          end
        RUBY
      end

      it "registers an offense for #{ret}" 


      it "auto-corrects by replacing #{ret} with nil" 

    end

    it_behaves_like 'common behavior', 'return'
    it_behaves_like 'common behavior', 'return()'
  end

  context 'when multi-value returns are not allowed' do
    it 'reports an offense for def with only a return' 


    it 'reports an offense for defs with only a return' 


    it 'reports an offense for def ending with return' 


    it 'reports an offense for defs ending with return' 


    it 'registers a helpful message for defs with multiple returns' 


    it 'auto-corrects by making implicit arrays explicit' 


    it 'auto-corrects removes return when using an explicit hash' 


    it 'auto-corrects by making an implicit hash explicit' 

  end

  context 'when multi-value returns are allowed' do
    let(:cop_config) { { 'AllowMultipleReturnValues' => true } }

    it 'accepts def with only a return' 


    it 'accepts defs with only a return' 


    it 'accepts def ending with return' 


    it 'accepts defs ending with return' 


    it 'does not auto-correct' 

  end

  context 'when return is inside begin-end body' do
    let(:src) do
      <<-RUBY.strip_indent
        def func
          begin
            return 1
          end
        end
      RUBY
    end

    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'when rescue and return blocks present' do
    let(:src) do
      <<-RUBY.strip_indent
        def func
          1
          2
          return 3
        rescue SomeException
          4
          return 5
        rescue AnotherException
          return 6
        ensure
          return 7
        end
      RUBY
    end

    it 'does register an offense when inside function or rescue block' 


    it 'auto-corrects' 

  end

  context 'when return is inside an if-branch' do
    let(:src) do
      <<-RUBY.strip_indent
        def func
          if x
            return 1
          elsif y
            return 2
          else
            return 3
          end
        end
      RUBY
    end

    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'when return is inside a when-branch' do
    let(:src) do
      <<-RUBY.strip_indent
        def func
          case x
          when y then return 1
          when z then return 2
          when q
          else
            return 3
          end
        end
      RUBY
    end

    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'when case nodes are empty' do
    it 'accepts empty when nodes' 

  end
end

