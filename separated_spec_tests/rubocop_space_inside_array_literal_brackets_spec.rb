# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceInsideArrayLiteralBrackets, :config do
  subject(:cop) { described_class.new(config) }

  it 'does not register offense for any kind of reference brackets' 


  context 'with space inside empty brackets not allowed' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBrackets' => 'no_space' } }

    it 'accepts empty brackets with no space inside' 


    it 'registers an offense for empty brackets with one space inside' 


    it 'registers an offense for empty brackets with lots of space inside' 


    it 'auto-corrects an unwanted single space' 


    it 'auto-corrects multiple unwanted spaces' 

  end

  context 'with space inside empty braces allowed' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBrackets' => 'space' } }

    it 'accepts empty brackets with space inside' 


    it 'registers offense for empty brackets with no space inside' 


    it 'registers offense for empty brackets with more than one space inside' 


    it 'auto-corrects missing space' 


    it 'auto-corrects too many spaces' 

  end

  context 'when EnforcedStyle is no_space' do
    let(:cop_config) { { 'EnforcedStyle' => 'no_space' } }

    it 'does not register offense for arrays with no spaces' 


    it 'does not register offense for arrays using ref brackets' 


    it 'does not register offense when 2 arrays on one line' 


    it 'does not register offense for array when brackets get own line' 


    it 'does not register offense for indented array ' \
       'when bottom bracket gets its own line & is misaligned' do
      expect_no_offenses(<<-RUBY.strip_indent)
        def do_stuff
          a = [
            1, 2
            ]
        end
      RUBY
    end

    it 'does not register offense when bottom bracket gets its ' \
       'own line & has trailing method' do
      expect_no_offenses(<<-RUBY.strip_indent)
        a = [
          1, 2, nil
            ].compact
      RUBY
    end

    it 'does not register offense for valid multiline array' 


    it 'does not register offense for valid 2-dimensional array' 


    it 'accepts space inside array brackets if with comment' 


    it 'accepts square brackets as method name' 


    it 'does not register offense when contains an array literal as ' \
       'an argument after a heredoc is started' do
      expect_no_offenses(<<-RUBY.strip_indent)
        ActiveRecord::Base.connection.execute(<<-SQL, [self.class.to_s]).first["count"]
          SELECT COUNT(widgets.id) FROM widgets
          WHERE widget_type = $1
        SQL
      RUBY
    end

    it 'accepts square brackets called with method call syntax' 


    it 'registers offense in array brackets with leading whitespace' 


    it 'registers offense in array brackets with trailing whitespace' 


    it 'registers offense in correct array when two on one line' 


    it 'registers offense in multiline array on end bracket' 


    it 'registers offense in multiline array on end bracket' \
       'with trailing method' do
      expect_offense(<<-RUBY.strip_indent)
        [:good,
         :bad  ].compact
             ^^ Do not use space inside array brackets.
      RUBY
    end

    it 'register offense when 2 arrays on one line' 


    it 'registers offense when contains an array literal as ' \
       'an argument with trailing whitespace after a heredoc is started' do
      expect_offense(<<-RUBY.strip_indent)
        ActiveRecord::Base.connection.execute(<<-SQL, [self.class.to_s ]).first["count"]
                                                                      ^ Do not use space inside array brackets.
          SELECT COUNT(widgets.id) FROM widgets
          WHERE widget_type = $1
        SQL
      RUBY
    end

    context 'auto-corrects' do
      it 'fixes multiple offenses in one set of array brackets' 


      it 'fixes multiple offenses in two sets of array brackets' 


      it 'fixes multiline offenses but does not fuss with alignment' 


      it 'fixes multiline offenses with trailing method' 


      it 'ignores multiline array with whitespace before end bracket' 

    end
  end

  shared_examples 'space inside arrays' do
    it 'does not register offense for arrays with spaces' 


    it 'does not register offense for arrays using ref brackets' 


    it 'does not register offense when 2 arrays on one line' 


    it 'does not register offense for array when brackets get their own line' 


    it 'does not register offense for indented array ' \
       'when bottom bracket gets its own line & is misaligned' do
      expect_no_offenses(<<-RUBY.strip_indent)
        def do_stuff
          a = [
            1, 2
            ]
        end
      RUBY
    end

    it 'does not register offense when bottom bracket gets its ' \
       'own line & has trailing method' do
      expect_no_offenses(<<-RUBY.strip_indent)
        a = [
          1, 2, nil
            ].compact
      RUBY
    end

    it 'does not register offense for valid multiline array' 


    it 'accepts space inside array brackets with comment' 


    it 'accepts square brackets as method name' 


    it 'accepts square brackets called with method call syntax' 


    it 'registers offense in array brackets with no leading whitespace' 


    it 'registers offense in array brackets with no trailing whitespace' 


    it 'registers offense in correct array when two on one line' 


    it 'registers offense in multiline array on end bracket' 


    it 'registers offense in multiline array on end bracket' \
       'with trailing method' do
      expect_offense(<<-RUBY.strip_indent)
        [ :good,
          :bad].compact
              ^ Use space inside array brackets.
      RUBY
    end

    it 'register offense when 2 arrays on one line' 


    context 'auto-corrects' do
      it 'fixes multiple offenses in one set of array brackets' 


      it 'fixes multiple offenses in two sets of array brackets' 


      it 'fixes multiline offenses but does not fuss with alignment' 


      it 'fixes multiline offenses with trailing method' 


      it 'ignores multiline array with no whitespace before end bracket' 

    end
  end

  context 'when EnforcedStyle is space' do
    let(:cop_config) { { 'EnforcedStyle' => 'space' } }

    it_behaves_like 'space inside arrays'

    it 'does not register offense for valid 2-dimensional array' 

  end

  context 'when EnforcedStyle is compact' do
    let(:cop_config) { { 'EnforcedStyle' => 'compact' } }

    it_behaves_like 'space inside arrays'

    it 'does not register offense for valid 2-dimensional array' 


    it 'does not register offense for valid 3-dimensional array' 


    it 'does not register offense for valid 4-dimensional array' 


    it 'registers offense if space between 2 closing brackets' 


    it 'registers offense if space between 2 opening brackets' 


    context 'auto-corrects' do
      it 'fixes 2-dimensional array with extra spaces' 


      it 'fixes offensive 3-dimensional array' 


      it 'ignores multi-dimensional multiline array with no ' \
         'whitespace before end bracket' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          stuff = [
            a,
            [ b, c ]
            ]
        RUBY
        expect(new_source).to eq(<<-RUBY.strip_indent)
          stuff = [
            a,
            [ b, c ]
            ]
        RUBY
      end
    end
  end
end

