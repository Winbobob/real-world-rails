# frozen_string_literal: true

require 'timeout'

RSpec.describe RuboCop::CLI, :isolated_environment do
  include_context 'cli spec behavior'

  subject(:cli) { described_class.new }

  context 'when interrupted' do
    it 'returns 1' 

  end

  describe '#trap_interrupt' do
    let(:runner) { RuboCop::Runner.new({}, RuboCop::ConfigStore.new) }
    let(:interrupt_handlers) { [] }

    before do
      allow(Signal).to receive(:trap).with('INT') do |&block|
        interrupt_handlers << block
      end
    end

    def interrupt
      interrupt_handlers.each(&:call)
    end

    it 'adds a handler for SIGINT' 


    context 'with SIGINT once' do
      it 'aborts processing' 


      it 'does not exit immediately' 

    end

    context 'with SIGINT twice' do
      it 'exits immediately' 

    end
  end

  context 'when given a file/directory that is not under the current dir' do
    shared_examples 'checks Rakefile' do
      it 'checks a Rakefile but Style/FileName does not report' 

    end

    context 'and the directory is absolute' do
      let(:checked_path) { abs('..') }

      include_examples 'checks Rakefile'
    end

    context 'and the directory is relative' do
      let(:checked_path) { '..' }

      include_examples 'checks Rakefile'
    end

    context 'and the Rakefile path is absolute' do
      let(:checked_path) { abs('../Rakefile') }

      include_examples 'checks Rakefile'
    end

    context 'and the Rakefile path is relative' do
      let(:checked_path) { '../Rakefile' }

      include_examples 'checks Rakefile'
    end
  end

  context 'when lines end with CR+LF' do
    it 'reports an offense' 

  end

  context 'when checking a correct file' do
    it 'returns 0' 


    context 'when super is used with a block' do
      it 'still returns 0' 

    end
  end

  it 'checks a given file with faults and returns 1' 


  it 'registers an offense for a syntax error' 


  it 'registers an offense for Parser warnings' 


  it 'can process a file with an invalid UTF-8 byte sequence' 


  context 'when errors are raised while processing files due to bugs' do
    let(:errors) do
      ['An error occurred while Encoding cop was inspecting file.rb.']
    end

    before do
      allow_any_instance_of(RuboCop::Runner)
        .to receive(:errors).and_return(errors)
    end

    it 'displays an error message to stderr' 

  end

  describe 'rubocop:disable comment' do
    it 'can disable all cops in a code section' 


    context 'when --auto-correct is given' do
      it 'does not trigger UnneededCopDisableDirective due to ' \
         'lines moving around' do
        src = ['a = 1 # rubocop:disable Lint/UselessAssignment']
        create_file('example.rb', src)
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          Style/FrozenStringLiteralComment:
            Enabled: true
            EnforcedStyle: always
        YAML
        expect(cli.run(['--format', 'offenses', '-a', 'example.rb'])).to eq(0)
        expect($stdout.string).to eq(<<-RESULT.strip_indent)

          1  Style/FrozenStringLiteralComment
          --
          1  Total

        RESULT
        expect(IO.read('example.rb'))
          .to eq(<<-RUBY.strip_indent)
            # frozen_string_literal: true

            a = 1 # rubocop:disable Lint/UselessAssignment
        RUBY
      end
    end

    it 'can disable selected cops in a code section' 


    it 'can disable all cops on a single line' 


    it 'can disable selected cops on a single line' 


    context 'without using namespace' do
      it 'can disable selected cops on a single line' 

    end

    context 'when not necessary' do
      it 'causes an offense to be reported' 


      context 'and there are no other offenses' do
        it 'exits with error code' 

      end

      shared_examples 'UnneededCopDisableDirective not run' do |state, config|
        context "and UnneededCopDisableDirective is #{state}" do
          it 'does not report UnneededCopDisableDirective offenses' 

        end
      end

      include_examples 'UnneededCopDisableDirective not run',
                       'individually disabled', <<-YAML.strip_indent
        Lint/UnneededCopDisableDirective:
          Enabled: false
      YAML
      include_examples 'UnneededCopDisableDirective not run',
                       'individually excluded', <<-YAML.strip_indent
        Lint/UnneededCopDisableDirective:
          Exclude:
            - example.rb
      YAML
      include_examples 'UnneededCopDisableDirective not run',
                       'disabled through department', <<-YAML.strip_indent
        Lint:
          Enabled: false
      YAML
    end
  end

  it 'finds a file with no .rb extension but has a shebang line' 


  it 'does not register any offenses for an empty file' 


  describe 'style guide only usage' do
    context 'via the cli option' do
      describe '--only-guide-cops' do
        it 'skips cops that have no link to a style guide' 


        it 'runs cops for rules that link to a style guide' 


        it 'overrides configuration of AllCops/StyleGuideCopsOnly' 

      end
    end

    context 'via the config' do
      before do
        create_file('example.rb', 'do_something or raise')
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            StyleGuideCopsOnly: #{guide_cops_only}
            DisabledByDefault: #{disabled_by_default}
          Metrics/LineLength:
            Enabled: true
            StyleGuide: ~
            Max: 2
        YAML
      end

      describe 'AllCops/StyleGuideCopsOnly' do
        let(:disabled_by_default) { 'false' }

        context 'when it is true' do
          let(:guide_cops_only) { 'true' }

          it 'skips cops that have no link to a style guide' 

        end

        context 'when it is false' do
          let(:guide_cops_only) { 'false' }

          it 'runs cops for rules regardless of any link to the style guide' 

        end
      end

      describe 'AllCops/DisabledByDefault' do
        let(:guide_cops_only) { 'false' }

        context 'when it is true' do
          let(:disabled_by_default) { 'true' }

          it 'runs only the cop configured in .rubocop.yml' 

        end

        context 'when it is false' do
          let(:disabled_by_default) { 'false' }

          it 'runs all cops that are enabled in default configuration' 

        end
      end
    end
  end

  describe 'rails cops' do
    before do
      RuboCop::ConfigLoader.default_configuration = nil
    end

    describe 'enabling/disabling' do
      it 'by default does not run rails cops' 


      it 'with -R given runs rails cops' 


      it 'with configuration option true in one dir runs rails cops there' 


      it 'with configuration option false but -R given runs rails cops' 


      context 'with obsolete RunRailsCops config option' do
        it 'prints a warning' 

      end
    end

    describe 'including/excluding' do
      it 'honors Exclude settings in .rubocop_todo.yml one level up' 


      it 'includes some directories by default' 

    end
  end

  describe 'cops can exclude files based on config' do
    it 'ignores excluded files' 

  end

  describe 'configuration from file' do
    before do
      RuboCop::ConfigLoader.default_configuration = nil
    end

    context 'when configured for rails style indentation' do
      it 'accepts rails style indentation' 


      %w[class module].each do |parent|
        it "registers offense for normal indentation in #{parent}" 

      end
    end

    context 'when obsolete MultiSpaceAllowedForOperators param is used' do
      it 'displays a warning' 

    end

    context 'when MultilineMethodCallIndentation is used with aligned ' \
            'style and IndentationWidth parameter' do
      it 'fails with an error message' 

    end

    context 'when MultilineOperationIndentation is used with aligned ' \
            'style and IndentationWidth parameter' do
      it 'fails with an error message' 

    end

    it 'allows the default configuration file as the -c argument' 


    context 'when --force-default-config option is specified' do
      shared_examples 'ignores config file' do
        it 'ignores config file' 

      end

      context 'when no config file specified' do
        let(:args) { %w[--format simple --force-default-config] }

        include_examples 'ignores config file'
      end

      context 'when config file specified with -c' do
        let(:args) do
          %w[--format simple --force-default-config -c .rubocop.yml]
        end

        include_examples 'ignores config file'
      end
    end

    it 'displays cop names if DisplayCopNames is false' 


    it 'displays style guide URLs if DisplayStyleGuide is true' 


    it 'uses the DefaultFormatter if another formatter is not specified' 


    it 'finds included files' 


    it 'ignores excluded files' 


    it 'only reads configuration in explicitly included hidden directories' 


    it 'does not consider Include parameters in subdirectories' 


    it 'matches included/excluded files correctly when . argument is given' 


    it 'does not read files in excluded list' 


    it 'can be configured with option to disable a certain error' 


    context 'without using namespace' do
      it 'can be configured with option to disable a certain error' 

    end

    it 'can disable parser-derived offenses with warning severity' 


    it 'cannot disable Syntax offenses' 


    it 'can be configured to merge a parameter that is a hash' 


    it 'can be configured to override a parameter that is a hash in a ' \
       'special case' do
      create_file('example1.rb', <<-RUBY.strip_indent)
        arr.select { |e| e > 0 }.collect { |e| e * 2 }
        a2.find_all { |e| e > 0 }
      RUBY
      # We prefer find_all over select. This setting overrides the default
      # select over find_all. Other preferred methods appearing in the default
      # config (e.g., map over collect) are kept.
      create_file('rubocop.yml', <<-YAML.strip_indent)
        Style/CollectionMethods:
          PreferredMethods:
            select: find_all
      YAML
      cli.run(['--format',
               'simple',
               '-c',
               'rubocop.yml',
               '--only',
               'CollectionMethods',
               'example1.rb'])
      expect($stdout.string)
        .to eq(<<-RESULT.strip_indent)
          == example1.rb ==
          C:  1:  5: Style/CollectionMethods: Prefer find_all over select.
          C:  1: 26: Style/CollectionMethods: Prefer map over collect.

          1 file inspected, 2 offenses detected
        RESULT
    end

    it 'works when a cop that others depend on is disabled' 


    it 'can be configured with project config to disable a certain error' 


    it 'can use an alternative max line length from a config file' 


    it 'can have different config files in different directories' 


    it 'prefers a config file in ancestor directory to another in home' 


    it 'can exclude directories relative to .rubocop.yml' 


    it 'can exclude a typical vendor directory' 


    it 'excludes the vendor directory by default' 


    # Being immune to bad configuration files in excluded directories has
    # become important due to a bug in rubygems
    # (https://github.com/rubygems/rubygems/issues/680) that makes
    # installations of, for example, rubocop lack their .rubocop.yml in the
    # root directory.
    it 'can exclude a vendor directory with an erroneous config file' 


    # Relative exclude paths in .rubocop.yml files are relative to that file,
    # but in configuration files with other names they will be relative to
    # whatever file inherits from them.
    it 'can exclude a vendor directory indirectly' 


    it 'prints a warning for an unrecognized cop name in .rubocop.yml' 


    it 'prints a warning for an unrecognized configuration parameter' 


    it 'prints an error message for an unrecognized EnforcedStyle' 


    it 'works when a configuration file passed by -c specifies Exclude ' \
       'with regexp' do
      create_file('example/example1.rb', '#' * 90)

      create_file('rubocop.yml', <<-'YAML'.strip_indent)
        AllCops:
          Exclude:
            - !ruby/regexp /example1\.rb$/
      YAML

      cli.run(%w[--format simple -c rubocop.yml])
      expect($stdout.string)
        .to eq(['', '0 files inspected, no offenses detected',
                ''].join("\n"))
    end

    it 'works when a configuration file passed by -c specifies Exclude ' \
       'with strings' do
      create_file('example/example1.rb', '#' * 90)

      create_file('rubocop.yml', <<-YAML.strip_indent)
        AllCops:
          Exclude:
            - example/**
      YAML

      cli.run(%w[--format simple -c rubocop.yml])
      expect($stdout.string)
        .to eq(['', '0 files inspected, no offenses detected',
                ''].join("\n"))
    end

    shared_examples 'specified Severity' do |key|
      it 'works when a configuration file specifies Severity for ' \
         "Metrics/ParameterLists and #{key}" do
        create_file('example/example1.rb', <<-RUBY.strip_indent)
          def method(foo, bar, qux, fred, arg5, f) end #{'#' * 45}
        RUBY

        create_file('rubocop.yml', <<-YAML.strip_indent)
          #{key}:
            Severity: error
          Metrics/ParameterLists:
            Severity: convention
        YAML

        cli.run(%w[--format simple -c rubocop.yml])
        expect($stdout.string).to eq(<<-RESULT.strip_indent)
            == example/example1.rb ==
            C:  1: 11: Metrics/ParameterLists: Avoid parameter lists longer than 5 parameters. [6/5]
            C:  1: 39: Naming/UncommunicativeMethodParamName: Method parameter must be at least 3 characters long.
            C:  1: 46: Style/CommentedKeyword: Do not place comments on the same line as the def keyword.
            E:  1: 81: Metrics/LineLength: Line is too long. [90/80]

            1 file inspected, 4 offenses detected
        RESULT
        expect($stderr.string).to eq('')
      end
    end

    include_examples 'specified Severity', 'Metrics/LineLength'
    include_examples 'specified Severity', 'Metrics'

    it 'fails when a configuration file specifies an invalid Severity' 


    it 'fails when a configuration file has invalid YAML syntax' 


    context 'when a file inherits from a higher level' do
      before do
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          Metrics/LineLength:
            Exclude:
              - dir/example.rb
        YAML
        create_file('dir/.rubocop.yml', 'inherit_from: ../.rubocop.yml')
        create_file('dir/example.rb', '#' * 90)
      end

      it 'inherits relative excludes correctly' 

    end

    context 'when configuration is taken from $HOME/.rubocop.yml' do
      before do
        create_file("#{Dir.home}/.rubocop.yml", <<-YAML.strip_indent)
          Metrics/LineLength:
            Exclude:
              - dir/example.rb
        YAML
        create_file('dir/example.rb', '#' * 90)
      end

      it 'handles relative excludes correctly when run from project root' 

    end

    it 'shows an error if the input file cannot be found' 

  end

  describe 'configuration of target Ruby versions' do
    context 'when configured with an unknown version' do
      it 'fails with an error message' 

    end

    context 'when configured with an unsupported ruby' do
      it 'fails with an error message' 

    end
  end

  context 'configuration of `require`' do
    context 'unknown library is specified' do
      it 'exits with 2' 

    end
  end

  describe 'obsolete cops' do
    context 'when configuration for TrailingComma is given' do
      it 'fails with an error message' 

    end
  end
end

