# frozen_string_literal: true

RSpec.describe RuboCop::CLI, :isolated_environment do
  include_context 'cli spec behavior'

  subject(:cli) { described_class.new }

  before do
    RuboCop::ConfigLoader.default_configuration = nil
  end

  describe '--parallel' do
    if RuboCop::Platform.windows?
      context 'on Windows' do
        it 'prints a warning' 

      end
    else
      context 'combined with AllCops:UseCache:false' do
        before do
          create_file('.rubocop.yml', ['AllCops:',
                                       '  UseCache: false'])
        end

        it 'fails with an error message' 

      end

      context 'on Unix-like systems' do
        it 'prints a message if --debug is specified' 


        it 'does not print a message if --debug is not specified' 

      end
    end
  end

  describe '--list-target-files' do
    context 'when there are no files' do
      it 'prints nothing with -L' 


      it 'prints nothing with --list-target-files' 

    end

    context 'when there are some files' do
      before do
        create_file('show.rabl2', 'object @user => :person')
        create_file('show.rabl', 'object @user => :person')
        create_file('app.rb', 'puts "hello world"')
        create_file('Gemfile', <<-RUBY.strip_indent)
          source "https://rubygems.org"
          gem "rubocop"
        RUBY
        create_file('lib/helper.rb', 'puts "helpful"')
      end

      context 'when there are no includes or excludes' do
        it 'prints known ruby files' 

      end

      context 'when there is an include and exclude' do
        before do
          create_file('.rubocop.yml', <<-YAML.strip_indent)
            AllCops:
              Exclude:
                - Gemfile
              Include:
                - "**/*.rb"
                - "**/*.rabl"
                - "**/*.rabl2"
          YAML
        end

        it 'prints the included files and not the excluded ones' 

      end
    end
  end

  describe '--version' do
    it 'exits cleanly' 

  end

  describe '--only' do
    context 'when one cop is given' do
      it 'runs just one cop' 


      it 'exits with error if an incorrect cop name is passed' 


      it 'displays correction candidate if an incorrect cop name is given' 


      it 'exits with error if an empty string is given' 


      %w[Syntax Lint/Syntax].each do |name|
        it "only checks syntax if #{name} is given" 

      end

      %w[Lint/UnneededCopDisableDirective
         UnneededCopDisableDirective].each do |name|
        it "exits with error if cop name #{name} is passed" 

      end

      it 'accepts cop names from plugins' 


      context 'without using namespace' do
        it 'runs just one cop' 

      end

      it 'enables the given cop' 

    end

    context 'when several cops are given' do
      it 'runs the given cops' 


      context 'and --lint' do
        it 'runs the given cops plus all enabled lint cops' 

      end
    end

    context 'when a namespace is given' do
      it 'runs all enabled cops in that namespace' 

    end

    context 'when three namespaces are given' do
      it 'runs all enabled cops in those namespaces' 

    end
  end

  describe '--except' do
    context 'when one name is given' do
      it 'exits with error if the cop name is incorrect' 


      it 'exits with error if an empty string is given' 


      it 'displays correction candidate if an incorrect cop name is given' 


      %w[Syntax Lint/Syntax].each do |name|
        it "exits with error if #{name} is given" 

      end
    end

    context 'when one cop plus one namespace are given' do
      it 'runs all cops except the given' 

    end

    context 'when one cop is given without namespace' do
      it 'disables the given cop' 

    end

    context 'when several cops are given' do
      %w[UnneededCopDisableDirective
         Lint/UnneededCopDisableDirective Lint].each do |cop_name|
        it "disables the given cops including #{cop_name}" 

      end
    end
  end

  describe '--lint' do
    it 'runs only lint cops' 

  end

  describe '-d/--debug' do
    it 'shows config files' 


    it 'shows cop names' 

  end

  describe '-D/--display-cop-names' do
    before do
      create_file('example1.rb', 'puts 0 # rubocop:disable NumericLiterals ')
    end

    let(:file) { abs('example1.rb') }

    it 'shows cop names' 


    context '--no-display-cop-names' do
      it 'does not show cop names' 

    end

    context 'DisplayCopNames: false in .rubocop.yml' do
      before do
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            DisplayCopNames: false
        YAML
      end

      it 'shows cop names' 


      context 'without --display-cop-names' do
        it 'does not show cop names' 

      end
    end
  end

  describe '-E/--extra-details' do
    it 'shows extra details' 

  end

  describe '-S/--display-style-guide' do
    it 'shows style guide entry' 


    it 'shows reference entry' 


    it 'shows style guide and reference entries' 

  end

  describe '--show-cops' do
    shared_examples('prints config') do
      it 'prints the current configuration' 

    end

    let(:cops) { RuboCop::Cop::Cop.all }
    let(:registry) { RuboCop::Cop::Cop.registry }

    let(:global_conf) do
      config_path =
        RuboCop::ConfigLoader.configuration_file_for(Dir.pwd.to_s)
      RuboCop::ConfigLoader.configuration_from_file(config_path)
    end

    let(:stdout) { $stdout.string }

    before do
      create_file('.rubocop.yml', <<-YAML.strip_indent)
        Metrics/LineLength:
          Max: 110
      YAML
      # expect(cli.run(['--show-cops'] + arguments)).to eq(0)
      cli.run(['--show-cops'] + arguments)
    end

    context 'with no args' do
      let(:arguments) { [] }

      # Extracts the first line out of the description
      def short_description_of_cop(cop)
        desc = full_description_of_cop(cop)
        desc ? desc.lines.first.strip : ''
      end

      # Gets the full description of the cop or nil if no description is set.
      def full_description_of_cop(cop)
        cop_config = global_conf.for_cop(cop)
        cop_config['Description']
      end

      it 'prints all available cops and their description' 


      it 'prints all departments' 


      it 'prints all cops in their right department listing' 


      include_examples 'prints config'
    end

    context 'with one cop given' do
      let(:arguments) { ['Layout/Tab'] }

      it 'prints that cop and nothing else' 


      include_examples 'prints config'
    end

    context 'with two cops given' do
      let(:arguments) { ['Layout/Tab,Metrics/LineLength'] }

      include_examples 'prints config'
    end

    context 'with one of the cops misspelled' do
      let(:arguments) { ['Layout/Tab,Lint/X123'] }

      it 'skips the unknown cop' 

    end

    context 'with --force-default-config' do
      let(:arguments) { ['Metrics/LineLength', '--force-default-config'] }

      it 'prioritizes default config' 

    end
  end

  describe '-f/--format' do
    let(:target_file) { 'example.rb' }

    before do
      create_file(target_file, '#' * 90)
    end

    describe 'builtin formatters' do
      context 'when simple format is specified' do
        it 'outputs with simple format' 

      end

      %w[html json].each do |format|
        context "when #{format} format is specified" do
          context 'and offenses come from the cache' do
            context 'and a message has binary encoding' do
              let(:message_from_cache) do
                'Cyclomatic complexity for 文 is too high. [8/6]'
                  .dup
                  .force_encoding('ASCII-8BIT')
              end
              let(:data_from_cache) do
                [
                  {
                    'severity' => 'convention',
                    'location' => { 'begin_pos' => 18, 'end_pos' => 21 },
                    'message' => message_from_cache,
                    'cop_name' => 'Metrics/CyclomaticComplexity',
                    'status' => 'unsupported'
                  }
                ]
              end

              it "outputs #{format.upcase} code without crashing" 

            end
          end
        end
      end

      context 'when clang format is specified' do
        it 'outputs with clang format' 

      end

      context 'when emacs format is specified' do
        it 'outputs with emacs format' 

      end

      context 'when unknown format name is specified' do
        it 'aborts with error message' 

      end

      context 'when ambiguous format name is specified' do
        it 'aborts with error message' 

      end
    end

    describe 'custom formatter' do
      let(:target_file) { abs('example.rb') }

      context 'when a class name is specified' do
        it 'uses the class as a formatter' 

      end

      context 'when unknown class name is specified' do
        it 'aborts with error message' 

      end
    end

    it 'can be used multiple times' 

  end

  describe '-o/--out option' do
    let(:target_file) { 'example.rb' }

    before do
      create_file(target_file, '#' * 90)
    end

    it 'redirects output to the specified file' 


    it 'is applied to the previously specified formatter' 

  end

  describe '--fail-level option' do
    let(:target_file) { 'example.rb' }

    before do
      create_file(target_file, <<-RUBY.strip_indent)
        def f
         x
        end
      RUBY
    end

    def expect_offense_detected
      expect($stderr.string).to eq('')
      expect($stdout.string)
        .to include('1 file inspected, 1 offense detected')
      expect($stdout.string).to include 'Layout/IndentationWidth'
    end

    it 'fails when option is less than the severity level' 


    it 'fails when option is equal to the severity level' 


    it 'succeeds when option is greater than the severity level' 


    context 'with --display-only-fail-level-offenses' do
      it 'outputs offense message when fail-level is less than the severity' 


      it 'outputs offense message when fail-level is equal to the severity' 


      it "doesn't output offense message when less than the fail-level" 


      context 'with disabled line' do
        it "doesn't consider a unprinted offense to be an unneeded disable" 


        it "still checks unprinted offense if they're an unneeded disable" 

      end
    end

    context 'with --auto-correct' do
      def expect_auto_corrected
        expect_offense_detected
        expect($stdout.string.lines.to_a.last)
          .to eq('1 file inspected, 1 offense detected, ' \
                 "1 offense corrected\n")
      end

      it 'fails when option is autocorrect and all offenses are ' \
         'autocorrected' do
        expect(cli.run(['--auto-correct', '--format', 'simple',
                        '--fail-level', 'autocorrect',
                        target_file])).to eq(1)
        expect_auto_corrected
      end

      it 'fails when option is A and all offenses are autocorrected' 


      it 'succeeds when option is not given and all offenses are ' \
         'autocorrected' do
        expect(cli.run(['--auto-correct', '--format', 'simple',
                        target_file])).to eq(0)
        expect_auto_corrected
      end

      it 'succeeds when option is refactor and all offenses are ' \
         'autocorrected' do
        expect(cli.run(['--auto-correct', '--format', 'simple',
                        '--fail-level', 'refactor',
                        target_file])).to eq(0)
        expect_auto_corrected
      end
    end
  end

  describe 'with --auto-correct and disabled offense' do
    let(:target_file) { 'example.rb' }

    it 'succeeds when there is only a disabled offense' 

  end

  describe '--force-exclusion' do
    context 'when explicitly excluded' do
      let(:target_file) { 'example.rb' }

      before do
        create_file(target_file, '#' * 90)

        create_file('.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            Exclude:
              - #{target_file}
        YAML
      end

      it 'excludes files specified in the configuration Exclude ' \
         'even if they are explicitly passed as arguments' do
        expect(cli.run(['--force-exclusion', target_file])).to eq(0)
      end
    end

    context 'with already excluded by default' do
      let(:target_file) { 'TODO.md' }

      before do
        create_file(target_file, '- one')
      end

      it 'excludes files excluded by default even if they are ' \
         'explicitly passed as arguments' do
        expect(cli.run(['--force-exclusion', target_file])).to eq(0)
      end
    end
  end

  describe '--stdin' do
    it 'causes source code to be read from stdin' 


    it 'requires a file path' 


    it 'does not accept more than one file path' 


    it 'prints corrected code to stdout if --auto-correct is used' 


    it 'detects CR at end of line' 

  end

  describe 'option is invalid' do
    it 'suggests to use the --help flag' 

  end
end

