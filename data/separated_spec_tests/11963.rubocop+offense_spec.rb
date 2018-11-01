# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Offense do
  subject(:offense) do
    described_class.new(:convention, location, 'message', 'CopName', :corrected)
  end

  let(:location) do
    source_buffer = Parser::Source::Buffer.new('test', 1)
    source_buffer.source = "a\n"
    Parser::Source::Range.new(source_buffer, 0, 1)
  end

  it 'has a few required attributes' 


  it 'overrides #to_s' 


  it 'does not blow up if a message contains %' 


  it 'redefines == to compare offenses based on their contents' 


  it 'is frozen' 


  %i[severity location message cop_name].each do |a|
    describe "##{a}" do
      it 'is frozen' 

    end
  end

  context 'when unknown severity is passed' do
    it 'raises error' 

  end

  describe '#severity_level' do
    subject(:severity_level) do
      described_class.new(severity, location, 'message', 'CopName')
                     .severity
                     .level
    end

    context 'when severity is :refactor' do
      let(:severity) { :refactor }

      it 'is 1' 

    end

    context 'when severity is :fatal' do
      let(:severity) { :fatal }

      it 'is 5' 

    end
  end

  describe '#<=>' do
    def offense(hash = {})
      attrs = {
        sev: :convention,
        line: 5,
        col: 5,
        mes: 'message',
        cop: 'CopName'
      }.merge(hash)

      described_class.new(
        attrs[:sev],
        location(attrs[:line], attrs[:col],
                 %w[aaaaaa bbbbbb cccccc dddddd eeeeee ffffff]),
        attrs[:mes],
        attrs[:cop]
      )
    end

    def location(line, column, source)
      source_buffer = Parser::Source::Buffer.new('test', 1)
      source_buffer.source = source.join("\n")
      begin_pos = source[0...(line - 1)].reduce(0) do |a, e|
        a + e.length + 1
      end + column
      Parser::Source::Range.new(source_buffer, begin_pos, begin_pos + 1)
    end

    # We want a nice table layout, so we allow space inside empty hashes.
    # rubocop:disable Layout/SpaceInsideHashLiteralBraces, Layout/ExtraSpacing
    [
      [{                           }, {                           }, 0],

      [{ line: 6                   }, { line: 5                   }, 1],

      [{ line: 5, col: 6           }, { line: 5, col: 5           }, 1],
      [{ line: 6, col: 4           }, { line: 5, col: 5           }, 1],

      [{                  cop: 'B' }, {                  cop: 'A' }, 1],
      [{ line: 6,         cop: 'A' }, { line: 5,         cop: 'B' }, 1],
      [{          col: 6, cop: 'A' }, {          col: 5, cop: 'B' }, 1]
    ].each do |one, other, expectation|
      # rubocop:enable Layout/SpaceInsideHashLiteralBraces, Layout/ExtraSpacing
      context "when receiver has #{one} and other has #{other}" do
        it "returns #{expectation}" 

      end
    end
  end

  context 'offenses that span multiple lines' do
    subject(:offense) do
      described_class
        .new(:convention, location, 'message', 'CopName', :corrected)
    end

    let(:location) do
      source_buffer = Parser::Source::Buffer.new('test', 1)
      source_buffer.source = <<-RUBY.strip_indent
        def foo
          something
          something_else
        end
      RUBY
      Parser::Source::Range.new(source_buffer, 0, source_buffer.source.length)
    end

    it 'highlights the first line' 

  end

  context 'offenses that span part of a line' do
    subject(:offense) do
      described_class
        .new(:convention, location, 'message', 'CopName', :corrected)
    end

    let(:location) do
      source_buffer = Parser::Source::Buffer.new('test', 1)
      source_buffer.source = <<-RUBY.strip_indent
        def Foo
          something
          something_else
        end
      RUBY
      Parser::Source::Range.new(source_buffer, 4, 7)
    end

    it 'highlights the first line' 

  end
end

