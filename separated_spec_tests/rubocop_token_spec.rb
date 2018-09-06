# frozen_string_literal: true

RSpec.describe RuboCop::Token do
  let(:processed_source) { RuboCop::ProcessedSource.new(source, ruby_version) }
  let(:ruby_version) { RuboCop::Config::KNOWN_RUBIES.last }

  let(:source) { <<-RUBY.strip_indent }
    # comment
    def some_method
      [ 1, 2 ];
      foo[0] = 3
    end
  RUBY

  let(:first_token) { processed_source.tokens.first }
  let(:comment_token) do
    processed_source.find_token do |t|
      t.text.start_with?('#') && t.line == 1
    end
  end

  let(:left_array_bracket_token) do
    processed_source.find_token { |t| t.text == '[' && t.line == 3 }
  end
  let(:comma_token) { processed_source.find_token { |t| t.text == ',' } }
  let(:right_array_bracket_token) do
    processed_source.find_token { |t| t.text == ']' && t.line == 3 }
  end
  let(:semicolon_token) { processed_source.find_token { |t| t.text == ';' } }

  let(:left_ref_bracket_token) do
    processed_source.find_token { |t| t.text == '[' && t.line == 4 }
  end
  let(:zero_token) { processed_source.find_token { |t| t.text == '0' } }
  let(:right_ref_bracket_token) do
    processed_source.find_token { |t| t.text == ']' && t.line == 4 }
  end
  let(:equals_token) { processed_source.find_token { |t| t.text == '=' } }

  let(:end_token) { processed_source.find_token { |t| t.text == 'end' } }

  describe '.from_parser_token' do
    subject(:token) { described_class.from_parser_token(parser_token) }

    let(:parser_token) { [type, [text, range]] }
    let(:type) { :kDEF }
    let(:text) { 'def' }
    let(:range) { double('range', line: 42, column: 30) }

    it "sets parser token's type to rubocop token's type" 


    it "sets parser token's text to rubocop token's text" 


    it "sets parser token's range to rubocop token's pos" 


    it 'returns a #to_s useful for debugging' 

  end

  describe '#line' do
    it 'returns line of token' 

  end

  describe '#column' do
    it 'returns index of first char in token range on that line' 

  end

  describe '#begin_pos' do
    it 'returns index of first char in token range of entire source' 

  end

  describe '#end_pos' do
    it 'returns index of last char in token range of entire source' 

  end

  describe '#space_after' do
    it 'returns truthy MatchData when there is a space after token' 


    it 'returns nil when there is not a space after token' 

  end

  describe '#to_s' do
    it 'returns string of token data' 

  end

  describe '#space_before' do
    it 'returns truthy MatchData when there is a space before token' 


    it 'returns nil when there is not a space before token' 

  end

  context 'type predicates' do
    describe '#comment?' do
      it 'returns true for comment tokens' 


      it 'returns false for non comment tokens' 

    end

    describe '#semicolon?' do
      it 'returns true for semicolon tokens' 


      it 'returns false for non semicolon tokens' 

    end

    describe '#left_array_bracket?' do
      it 'returns true for left_array_bracket tokens' 


      it 'returns false for non left_array_bracket tokens' 

    end

    describe '#left_ref_bracket?' do
      it 'returns true for left_ref_bracket tokens' 


      it 'returns false for non left_ref_bracket tokens' 

    end

    describe '#left_bracket?' do
      it 'returns true for all left_bracket tokens' 


      it 'returns false for non left_bracket tokens' 

    end

    describe '#right_bracket?' do
      it 'returns true for all right_bracket tokens' 


      it 'returns false for non right_bracket tokens' 

    end

    describe '#left_brace?' do
      it 'returns true for right_bracket tokens' 


      it 'returns false for non right_bracket tokens' 

    end

    describe '#comma?' do
      it 'returns true for comma tokens' 


      it 'returns false for non comma tokens' 

    end

    describe '#rescue_modifier?' do
      let(:source) { <<-RUBY.strip_indent }
        def foo
          bar rescue qux
        end
      RUBY

      let(:rescue_modifier_token) do
        processed_source.find_token { |t| t.text == 'rescue' }
      end

      it 'returns true for rescue modifier tokens' 


      it 'returns false for non rescue modifier tokens' 

    end

    describe '#end?' do
      it 'returns true for end tokens' 


      it 'returns false for non end tokens' 

    end

    describe '#equals_sign?' do
      it 'returns true for equals sign tokens' 


      it 'returns false for non equals sign tokens' 

    end

    context 'with braces & parens' do
      let(:source) { <<-RUBY.strip_indent }
        { a: 1 }
        foo { |f| bar(f) }
      RUBY

      let(:left_hash_brace_token) do
        processed_source.find_token { |t| t.text == '{' && t.line == 1 }
      end
      let(:right_hash_brace_token) do
        processed_source.find_token { |t| t.text == '}' && t.line == 1 }
      end

      let(:left_block_brace_token) do
        processed_source.find_token { |t| t.text == '{' && t.line == 2 }
      end
      let(:left_parens_token) do
        processed_source.find_token { |t| t.text == '(' }
      end
      let(:right_parens_token) do
        processed_source.find_token { |t| t.text == ')' }
      end
      let(:right_block_brace_token) do
        processed_source.find_token { |t| t.text == '}' && t.line == 2 }
      end

      describe '#left_brace?' do
        it 'returns true for left hash brace tokens' 


        it 'returns false for non left hash brace tokens' 

      end

      describe '#left_curly_brace?' do
        it 'returns true for left block brace tokens' 


        it 'returns false for non left block brace tokens' 

      end

      describe '#right_curly_brace?' do
        it 'returns true for all right brace tokens' 


        it 'returns false for non right brace tokens' 

      end

      describe '#left_parens?' do
        it 'returns true for left parens tokens' 


        it 'returns false for non left parens tokens' 

      end

      describe '#right_parens?' do
        it 'returns true for right parens tokens' 


        it 'returns false for non right parens tokens' 

      end
    end
  end
end

