# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::AlignParameters do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/AlignParameters' => cop_config,
                        'Layout/IndentationWidth' => {
                          'Width' => indentation_width
                        })
  end
  let(:indentation_width) { 2 }

  context 'aligned with first parameter' do
    let(:cop_config) do
      {
        'EnforcedStyle' => 'with_first_parameter'
      }
    end

    it 'registers an offense for parameters with single indent' 


    it 'registers an offense for parameters with double indent' 


    it 'accepts multiline []= method call' 


    it 'accepts correctly aligned parameters' 


    it 'accepts correctly aligned parameters with fullwidth characters' 


    it 'accepts calls that only span one line' 


    it "doesn't get confused by a symbol argument" 


    it "doesn't get confused by splat operator" 


    it "doesn't get confused by extra comma at the end" 


    it 'can handle a correctly aligned string literal as first argument' 


    it 'can handle a string literal as other argument' 


    it "doesn't get confused by a line break inside a parameter" 


    it "doesn't get confused by symbols with embedded expressions" 


    it "doesn't get confused by regexen with embedded expressions" 


    it 'accepts braceless hashes' 


    it 'accepts the first parameter being on a new row' 


    it 'can handle heredoc strings' 


    it 'can handle a method call within a method call' 


    it 'can handle a call embedded in a string' 


    it 'can handle do-end' 


    it 'can handle a call with a block inside another call' 


    it 'can handle a ternary condition with a block reference' 


    it 'can handle parentheses used with no parameters' 


    it 'can handle a multiline hash as second parameter' 


    it 'can handle method calls without parentheses' 


    it 'can handle other method calls without parentheses' 


    it "doesn't crash and burn when there are nested issues" 


    context 'method definitions' do
      it 'registers an offense for parameters with single indent' 


      it 'registers an offense for parameters with double indent' 


      it 'accepts parameter lists on a single line' 


      it 'accepts proper indentation' 


      it 'accepts the first parameter being on a new row' 


      it 'accepts a method definition without parameters' 


      it "doesn't get confused by splat" 


      it 'auto-corrects alignment' 


      context 'defining self.method' do
        it 'registers an offense for parameters with single indent' 


        it 'accepts proper indentation' 


        it 'auto-corrects alignment' 

      end
    end

    context 'assigned methods' do
      it 'accepts the first parameter being on a new row' 


      it 'accepts the first parameter being on method row' 

    end

    it 'auto-corrects alignment' 


    it 'auto-corrects each line of a multi-line parameter to the right' 


    it 'auto-corrects each line of a multi-line parameter to the left' 


    it 'auto-corrects only parameters that begin a line' 


    it 'does not crash in autocorrect on dynamic string in parameter value' 

  end

  context 'aligned with fixed indentation' do
    let(:cop_config) do
      {
        'EnforcedStyle' => 'with_fixed_indentation'
      }
    end

    let(:correct_source) do
      <<-RUBY.strip_indent
        create :transaction, :closed,
          account:     account,
          open_price:  1.29,
          close_price: 1.30
      RUBY
    end

    it 'does not autocorrect correct source' 


    it 'autocorrects by outdenting when indented too far' 


    it 'autocorrects by indenting when not indented' 


    it 'autocorrects when first line is indented' 


    context 'multi-line method calls' do
      it 'can handle existing indentation from multi-line method calls' 


      it 'registers offenses for double indentation from relevant method' 


      it 'does not err on method call without a method name' 


      it 'autocorrects relative to position of relevant method call' 

    end

    context 'method definitions' do
      it 'registers an offense for parameters aligned to first param' 


      it 'registers an offense for parameters with double indent' 


      it 'accepts parameter lists on a single line' 


      it 'accepts proper indentation' 


      it 'accepts the first parameter being on a new row' 


      it 'accepts a method definition without parameters' 


      it "doesn't get confused by splat" 


      it 'auto-corrects alignment' 


      context 'defining self.method' do
        it 'registers an offense for parameters aligned to first param' 


        it 'accepts proper indentation' 


        it 'auto-corrects alignment' 

      end
    end

    context 'assigned methods' do
      context 'with IndentationWidth:Width set to 4' do
        let(:indentation_width) { 4 }

        it 'accepts the first parameter being on a new row' 


        it 'accepts the first parameter being on method row' 


        it 'autocorrects even when first argument is in wrong position' 

      end

      context 'with AlignParameters:IndentationWidth set to 4' do
        let(:config) do
          RuboCop::Config.new('Layout/AlignParameters' =>
                              cop_config.merge('IndentationWidth' => 4))
        end

        it 'accepts the first parameter being on a new row' 


        it 'accepts the first parameter being on method row' 

      end
    end
  end
end

