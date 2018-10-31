# frozen_string_literal: true

require 'timeout'

RSpec.describe RuboCop::CLI, :isolated_environment do
  include_context 'cli spec behavior'

  subject(:cli) { described_class.new }

  describe '--auto-gen-config' do
    before do
      RuboCop::Formatter::DisabledConfigFormatter
        .config_to_allow_offenses = {}
    end

    shared_examples 'LineLength handling' do |ctx, initial_dotfile, exp_dotfile|
      context ctx do
        # Since there is a line with length 99 in the inspected code,
        # Style/IfUnlessModifier will register an offense when
        # Metrics/LineLength:Max has been set to 99. With a lower
        # LineLength:Max there would be no IfUnlessModifier offense.
        it "bases other cops' configuration on the code base's current " \
           'maximum line length' do
          if initial_dotfile
            initial_config = YAML.safe_load(initial_dotfile.join($RS)) || {}
            inherited_files = Array(initial_config['inherit_from'])
            (inherited_files - ['.rubocop.yml']).each do |f|
              create_empty_file(f)
            end

            create_file('.rubocop.yml', initial_dotfile)
            create_file('.rubocop_todo.yml', [''])
          end
          create_file('example.rb', <<-RUBY.strip_indent)
            def f
            #{'  #' * 33}
              if #{'a' * 80}
                return y
              end

              z
            end
          RUBY
          expect(cli.run(['--auto-gen-config'])).to eq(0)
          expect(IO.readlines('.rubocop_todo.yml')
                   .drop_while { |line| line.start_with?('#') }.join)
            .to eq(<<-YAML.strip_indent)

              # Offense count: 1
              # Cop supports --auto-correct.
              Style/IfUnlessModifier:
                Exclude:
                  - 'example.rb'

              # Offense count: 2
              # Configuration parameters: AllowHeredoc, AllowURI, URISchemes, IgnoreCopDirectives, IgnoredPatterns.
              # URISchemes: http, https
              Metrics/LineLength:
                Max: 99
          YAML
          expect(IO.read('.rubocop.yml').strip).to eq(exp_dotfile.join($RS))
          $stdout = StringIO.new
          expect(described_class.new.run([])).to eq(0)
          expect($stderr.string).to eq('')
          expect($stdout.string).to include('no offenses detected')
        end
      end
    end

    include_examples 'LineLength handling',
                     'when .rubocop.yml does not exist',
                     nil,
                     ['inherit_from: .rubocop_todo.yml']

    include_examples 'LineLength handling',
                     'when .rubocop.yml is empty',
                     [''],
                     ['inherit_from: .rubocop_todo.yml']

    include_examples 'LineLength handling',
                     'when .rubocop.yml inherits only from .rubocop_todo.yml',
                     ['inherit_from: .rubocop_todo.yml'],
                     ['inherit_from: .rubocop_todo.yml']

    include_examples 'LineLength handling',
                     'when .rubocop.yml inherits only from .rubocop_todo.yml ' \
                     'in an array',
                     ['inherit_from:',
                      '  - .rubocop_todo.yml'],
                     ['inherit_from:',
                      '  - .rubocop_todo.yml']

    include_examples 'LineLength handling',
                     'when .rubocop.yml inherits from another file and ' \
                     '.rubocop_todo.yml',
                     ['inherit_from:',
                      '  - common.yml',
                      '  - .rubocop_todo.yml'],
                     ['inherit_from:',
                      '  - common.yml',
                      '  - .rubocop_todo.yml']

    include_examples 'LineLength handling',
                     'when .rubocop.yml inherits from two other files',
                     ['inherit_from:',
                      '  - common1.yml',
                      '  - common2.yml'],
                     ['inherit_from:',
                      '  - .rubocop_todo.yml',
                      '  - common1.yml',
                      '  - common2.yml']

    include_examples 'LineLength handling',
                     'when .rubocop.yml inherits from another file',
                     ['inherit_from: common.yml'],
                     ['inherit_from:',
                      '  - .rubocop_todo.yml',
                      '  - common.yml']

    include_examples 'LineLength handling',
                     "when .rubocop.yml doesn't inherit",
                     ['Style/For:',
                      '  Enabled: false'],
                     ['inherit_from: .rubocop_todo.yml',
                      '',
                      'Style/For:',
                      '  Enabled: false']

    context 'with Metrics/LineLength:Max overridden' do
      before do
        create_file('.rubocop.yml', ['Metrics/LineLength:',
                                     "  Max: #{line_length_max}"])
        create_file('.rubocop_todo.yml', [''])
        create_file('example.rb', <<-RUBY.strip_indent)
          def f
          #{'  #' * 33}
            if #{'a' * 80}
              return y
            end

            z
          end
        RUBY
      end

      context 'when .rubocop.yml has Metrics/LineLength:Max less than code ' \
              'base max' do
        let(:line_length_max) { 90 }

        it "bases other cops' configuration on the overridden LineLength:Max" 

      end

      context 'when .rubocop.yml has Metrics/LineLength:Max more than code ' \
              'base max' do
        let(:line_length_max) { 150 }

        it "bases other cops' configuration on the overridden LineLength:Max" 

      end
    end

    it 'overwrites an existing todo file' 


    it 'honors rubocop:disable comments' 


    context 'when --config is used' do
      it 'can generate a todo list' 

    end

    context 'when working in a subdirectory' do
      it 'can generate a todo list' 

    end

    it 'can generate a todo list' 


    it 'can generate Exclude properties with a given limit' 


    it 'does not generate configuration for the Syntax cop' 


    it 'generates a todo list that removes the reports' 


    it 'does not include offense counts when --no-offense-counts is used' 


    it 'generates Exclude instead of Max when --auto-gen-only-exclude is' \
       ' used' do
      create_file('example1.rb', ['#' * 90,
                                  'puts 123456'])
      create_file('example2.rb', <<-RUBY.strip_indent)
        def function(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
          puts 123456
        end
      RUBY
      # Make ConfigLoader reload the default configuration so that its
      # absolute Exclude paths will point into this example's work directory.
      RuboCop::ConfigLoader.default_configuration = nil

      expect(cli.run(['--auto-gen-config', '--auto-gen-only-exclude'])).to eq(0)
      actual = IO.read('.rubocop_todo.yml').split($RS)
      expect(actual.grep(/^[^#]/).join($RS)).to eq(<<-YAML.strip_indent.chomp)
        Lint/UnusedMethodArgument:
          Exclude:
            - 'example2.rb'
        Metrics/ParameterLists:
          Exclude:
            - 'example2.rb'
        Style/NumericLiterals:
          Exclude:
            - 'example1.rb'
            - 'example2.rb'
        Metrics/LineLength:
          Exclude:
            - 'example1.rb'
      YAML
    end

    it 'does not include a timestamp when --no-auto-gen-timestamp is used' 


    describe 'when different styles appear in different files' do
      before do
        create_file('example1.rb', ['$!'])
        create_file('example2.rb', ['$!'])
        create_file('example3.rb', ['$ERROR_INFO'])
      end

      it 'disables cop if --exclude-limit is exceeded' 


      it 'generates Exclude list if --exclude-limit is not exceeded' 

    end

    describe 'console output' do
      before do
        create_file('example1.rb', ['$!'])
      end

      it 'displays report summary but no offenses' 

    end

    it 'can be called when there are no files to inspection' 

  end
end

