# frozen_string_literal: true

RSpec.describe RuboCop::ProcessedSource do
  include FileHelper

  subject(:processed_source) { described_class.new(source, ruby_version, path) }

  let(:ruby_version) { RuboCop::Config::KNOWN_RUBIES.last }

  let(:source) { <<-RUBY.strip_indent }
    # an awesome method
    def some_method
      puts 'foo'
    end
    some_method
  RUBY

  let(:path) { 'path/to/file.rb' }

  describe '.from_file', :isolated_environment do
    describe 'when the file exists' do
      before do
        create_file(path, 'foo')
      end

      let(:processed_source) { described_class.from_file(path, ruby_version) }

      it 'returns an instance of ProcessedSource' 


      it "sets the file path to the instance's #path" 

    end

    it 'raises RuboCop::Error when the file does not exist' 

  end

  describe '#path' do
    it 'is the path passed to .new' 

  end

  describe '#buffer' do
    it 'is a source buffer' 

  end

  describe '#ast' do
    it 'is the root node of AST' 

  end

  describe '#comments' do
    it 'is an array of comments' 

  end

  describe '#tokens' do
    it 'has an array of tokens' 

  end

  shared_context 'invalid encoding source' do
    let(:source) do
      [
        "# \xf9"
      ].join("\n")
    end
  end

  describe '#parser_error' do
    context 'when the source was properly parsed' do
      it 'is nil' 

    end

    context 'when the source lacks encoding comment and is really utf-8 ' \
            'encoded but has been read as US-ASCII' do
      let(:source) do
        # When files are read into RuboCop, the encoding of source code
        # lacking an encoding comment will default to the external encoding,
        # which could for example be US-ASCII if the LC_ALL environment
        # variable is set to "C".
        '号码 = 3'.dup.force_encoding('US-ASCII')
      end

      it 'is nil' 

    end

    context 'when the source could not be parsed due to encoding error' do
      include_context 'invalid encoding source'

      it 'returns the error' 

    end
  end

  describe '#lines' do
    it 'is an array' 


    it 'has same number of elements as line count' 


    it 'contains lines as string without linefeed' 

  end

  describe '#[]' do
    context 'when an index is passed' do
      it 'returns the line' 

    end

    context 'when a range is passed' do
      it 'returns the array of lines' 

    end

    context 'when start index and length are passed' do
      it 'returns the array of lines' 

    end
  end

  describe 'valid_syntax?' do
    subject { processed_source.valid_syntax? }

    context 'when the source is completely valid' do
      let(:source) { 'def valid_code; end' }

      it 'returns true' 

    end

    context 'when the source is invalid' do
      let(:source) { 'def invalid_code; en' }

      it 'returns false' 

    end

    context 'when the source is valid but has some warning diagnostics' do
      let(:source) { 'do_something *array' }

      it 'returns true' 

    end

    context 'when the source could not be parsed due to encoding error' do
      include_context 'invalid encoding source'

      it 'returns false' 

    end

    # https://github.com/whitequark/parser/issues/283
    context 'when the source itself is valid encoding but includes strange ' \
            'encoding literals that are accepted by MRI' do
      let(:source) do
        'p "\xff"'
      end

      it 'returns true' 

    end

    context 'when a line starts with an integer literal' do
      let(:source) { '1 + 1' }

      # regression test
      it 'tokenizes the source correctly' 

    end
  end

  context 'with heavily commented source' do
    let(:source) { <<-RUBY.strip_indent }
      def foo # comment one
        bar # comment two
      end # comment three
      foo
    RUBY

    describe '#each_comment' do
      it 'yields all comments' 

    end

    describe '#find_comment' do
      it 'yields correct comment' 


      it 'yields nil when there is no match' 

    end

    describe '#commented?' do
      let(:source) { <<-RUBY.strip_indent }
        # comment
        [ 1, 2 ]
      RUBY

      context 'provided source_range on line with comment' do
        it 'returns true' 

      end

      context 'provided source_range on line without comment' do
        it 'returns false' 

      end
    end

    describe '#comments_before_line' do
      let(:source) { <<-RUBY.strip_indent }
        # comment one
        # comment two
        [ 1, 2 ]
        # comment three
      RUBY

      it 'returns comments on or before given line' 

    end
  end

  context 'token enumerables' do
    let(:source) { <<-RUBY.strip_indent }
      foo(1, 2)
    RUBY

    describe '#each_token' do
      it 'yields all tokens' 

    end

    describe '#find_token' do
      it 'yields correct token' 


      it 'yields nil when there is no match' 

    end
  end

  describe '#file_path' do
    it 'returns file path' 

  end

  describe '#blank?' do
    context 'with source of no content' do
      let(:source) { <<-RUBY.strip_indent }
      RUBY

      it 'returns true' 

    end

    context 'with source with content' do
      let(:source) { <<-RUBY.strip_indent }
        foo
      RUBY

      it 'returns false' 

    end
  end

  describe '#start_with?' do
    context 'with blank source' do
      let(:source) { <<-RUBY.strip_indent }
      RUBY

      it 'returns false' 

    end

    context 'with present source' do
      let(:source) { <<-RUBY.strip_indent }
        foo
      RUBY

      it 'returns true when passed string that starts source' 


      it 'returns false when passed string that does not start source' 

    end
  end

  describe '#preceding_line' do
    let(:source) { <<-RUBY.strip_indent }
      [ line, 1 ]
      { line: 2 }
      # line 3
    RUBY

    it 'returns source of line before token' 

  end

  describe '#following_line' do
    let(:source) { <<-RUBY.strip_indent }
      [ line, 1 ]
      { line: 2 }
      # line 3
    RUBY

    it 'returns source of line after token' 

  end
end

