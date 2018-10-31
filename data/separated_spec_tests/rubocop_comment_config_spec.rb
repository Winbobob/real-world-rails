# frozen_string_literal: true

RSpec.describe RuboCop::CommentConfig do
  subject(:comment_config) { described_class.new(parse_source(source)) }

  describe '#cop_enabled_at_line?' do
    let(:source) do
      [
        '# rubocop:disable Metrics/MethodLength with a comment why',
        'def some_method',
        "  puts 'foo'",                                      # 3
        'end',
        '# rubocop:enable Metrics/MethodLength',
        '',
        '# rubocop:disable all',
        'some_method',                                       # 8
        '# rubocop:enable all',
        '',
        "code = 'This is evil.'",
        'eval(code) # rubocop:disable Security/Eval',
        "puts 'This is not evil.'",                          # 12
        '',
        'def some_method',
        "  puts 'Disabling indented single line' # rubocop:disable " \
        'Metrics/LineLength',
        'end',
        '',                                                  # 18
        'string = <<END',
        'This is a string not a real comment # rubocop:disable Style/Loop',
        'END',
        '',
        'foo # rubocop:disable Style/MethodCallWithoutArgsParentheses', # 23
        '',
        '# rubocop:enable Lint/Void',
        '',
        '# rubocop:disable Style/For, Style/Not,Layout/Tab',
        'foo',                                               # 28
        '',
        'class One',
        '  # rubocop:disable Style/ClassVars',
        '  @@class_var = 1',
        'end',                                               # 33
        '',
        'class Two',
        '  # rubocop:disable Style/ClassVars',
        '  @@class_var = 2',
        'end',                                               # 38
        '# rubocop:enable Style/Not,Layout/Tab',
        '# rubocop:disable Style/Send, Lint/RandOne some comment why',
        '# rubocop:disable Layout/BlockAlignment some comment why',
        '# rubocop:enable Style/Send, Layout/BlockAlignment but why?',
        '# rubocop:enable Lint/RandOne foo bar!',            # 43
        '# rubocop:disable FlatMap',
        '[1, 2, 3, 4].map { |e| [e, e] }.flatten(1)',
        '# rubocop:enable FlatMap',
        '# rubocop:disable RSpec/Example',
        '# rubocop:disable Custom2/Number9'                  # 48
      ]
    end

    def disabled_lines_of_cop(cop)
      (1..source.size).each_with_object([]) do |line_number, disabled_lines|
        enabled = comment_config.cop_enabled_at_line?(cop, line_number)
        disabled_lines << line_number unless enabled
      end
    end

    it 'supports disabling multiple lines with a pair of directive' 


    it 'supports enabling/disabling multiple cops in a single directive' 


    it 'supports enabling/disabling multiple cops along with a comment' 


    it 'supports enabling/disabling cops without a prefix' 


    it 'supports disabling all lines after a directive' 


    it 'just ignores unpaired enabling directives' 


    it 'supports disabling single line with a directive at end of line' 


    it 'handles indented single line' 


    it 'does not confuse a comment directive embedded in a string literal ' \
       'with a real comment' do
      loop_disabled_lines = disabled_lines_of_cop('Loop')
      expect(loop_disabled_lines).not_to include(20)
    end

    it 'supports disabling all cops except Lint/UnneededCopDisableDirective ' \
       'with keyword all' do
      expected_part = (7..8).to_a

      cops = RuboCop::Cop::Cop.all.reject do |klass|
        klass == RuboCop::Cop::Lint::UnneededCopDisableDirective
      end

      cops.each do |cop|
        disabled_lines = disabled_lines_of_cop(cop)
        expect(disabled_lines & expected_part).to eq(expected_part)
      end
    end

    it 'does not confuse a cop name including "all" with all cops' 


    it 'can handle double disable of one cop' 


    it 'supports disabling cops with multiple uppercase letters' 


    it 'supports disabling cops with numbers in their name' 

  end
end

