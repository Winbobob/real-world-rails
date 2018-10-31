# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::ElseAlignment do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/EndAlignment' => end_alignment_config)
  end
  let(:end_alignment_config) do
    { 'Enabled' => true, 'EnforcedStyleAlignWith' => 'variable' }
  end

  it 'accepts a ternary if' 


  context 'with if statement' do
    it 'registers an offense for misaligned else' 


    it 'registers an offense for misaligned elsif' 


    it 'accepts indentation after else when if is on new line after ' \
       'assignment' do
      expect_no_offenses(<<-RUBY.strip_indent)
        Rails.application.config.ideal_postcodes_key =
          if Rails.env.production? || Rails.env.staging?
            "AAAA-AAAA-AAAA-AAAA"
          else
            "BBBB-BBBB-BBBB-BBBB"
          end
      RUBY
    end

    describe '#autocorrect' do
      it 'corrects bad alignment' 

    end

    it 'accepts a one line if statement' 


    it 'accepts a correctly aligned if/elsif/else/end' 


    context 'for a file with byte order mark' do
      let(:bom) { "\xef\xbb\xbf" }

      it 'accepts a correctly aligned if/elsif/else/end' 

    end

    context 'with assignment' do
      context 'when alignment style is variable' do
        context 'and end is aligned with variable' do
          it 'accepts an if-else with end aligned with setter' 


          it 'accepts an if-elsif-else with end aligned with setter' 


          it 'accepts an if with end aligned with element assignment' 


          it 'accepts an if/else' 


          it 'accepts an if/else with chaining after the end' 


          it 'accepts an if/else with chaining with a block after the end' 

        end

        context 'and end is aligned with keyword' do
          it 'registers offenses for an if with setter' 


          it 'registers an offense for an if with element assignment' 


          it 'registers an offense for an if' 

        end
      end

      shared_examples 'assignment and if with keyword alignment' do
        context 'and end is aligned with variable' do
          it 'registers an offense for an if' 


          it 'autocorrects bad alignment' 

        end

        context 'and end is aligned with keyword' do
          it 'accepts an if in assignment' 


          it 'accepts an if/else in assignment' 


          it 'accepts an if/else in assignment on next line' 


          it 'accepts a while in assignment' 


          it 'accepts an until in assignment' 

        end
      end

      context 'when alignment style is keyword by choice' do
        let(:end_alignment_config) do
          { 'Enabled' => true, 'EnforcedStyleAlignWith' => 'keyword' }
        end

        include_examples 'assignment and if with keyword alignment'
      end
    end

    it 'accepts an if/else branches with rescue clauses' 

  end

  context 'with unless' do
    it 'registers an offense for misaligned else' 


    it 'accepts a correctly aligned else in an otherwise empty unless' 


    it 'accepts an empty unless' 

  end

  context 'with case' do
    it 'registers an offense for misaligned else' 


    it 'accepts correctly aligned case/when/else' 


    it 'accepts case without else' 


    it 'accepts else aligned with when but not with case' 

  end

  context 'with def/defs' do
    it 'accepts an empty def body' 


    it 'accepts an empty defs body' 


    context 'when modifier and def are on the same line' do
      it 'accepts a correctly aligned body' 


      it 'registers an offense for else not aligned with private' 

    end
  end

  context 'with begin/rescue/else/ensure/end' do
    it 'registers an offense for misaligned else' 


    it 'accepts a correctly aligned else' 

  end

  context 'with def/rescue/else/ensure/end' do
    it 'accepts a correctly aligned else' 


    it 'registers an offense for misaligned else' 

  end

  context 'with def/rescue/else/end' do
    it 'accepts a correctly aligned else' 


    it 'registers an offense for misaligned else' 

  end

  context '>= Ruby 2.5 ensure/rescue/else in Block Argument', :ruby25 do
    it 'accepts a correctly aligned else' 


    it 'registers an offense for misaligned else' 

  end
end

