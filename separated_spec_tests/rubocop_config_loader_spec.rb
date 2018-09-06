# frozen_string_literal: true

RSpec.describe RuboCop::ConfigLoader do
  include FileHelper

  before { described_class.debug = true }
  after { described_class.debug = false }

  let(:default_config) { described_class.default_configuration }

  describe '.configuration_file_for', :isolated_environment do
    subject(:configuration_file_for) do
      described_class.configuration_file_for(dir_path)
    end

    context 'when no config file exists in ancestor directories' do
      let(:dir_path) { 'dir' }

      before { create_file('dir/example.rb', '') }

      context 'but a config file exists in home directory' do
        before { create_file('~/.rubocop.yml', '') }

        it 'returns the path to the file in home directory' 

      end

      context 'and no config file exists in home directory' do
        it 'falls back to the provided default file' 

      end

      context 'and ENV has no `HOME` defined' do
        before { ENV.delete 'HOME' }

        it 'falls back to the provided default file' 

      end
    end

    context 'when a config file exists in the parent directory' do
      let(:dir_path) { 'dir' }

      before do
        create_file('dir/example.rb', '')
        create_file('.rubocop.yml', '')
      end

      it 'returns the path to that configuration file' 

    end

    context 'when multiple config files exist in ancestor directories' do
      let(:dir_path) { 'dir' }

      before do
        create_file('dir/example.rb', '')
        create_file('dir/.rubocop.yml', '')
        create_file('.rubocop.yml', '')
      end

      it 'prefers closer config file' 

    end
  end

  describe '.configuration_from_file', :isolated_environment do
    subject(:configuration_from_file) do
      described_class.configuration_from_file(file_path)
    end

    context 'with any config file' do
      let(:file_path) { '.rubocop.yml' }

      before do
        create_file(file_path, <<-YAML.strip_indent)
          Style/Encoding:
            Enabled: false
        YAML
      end

      it 'returns a configuration inheriting from default.yml' 

    end

    context 'when multiple config files exist in ancestor directories' do
      let(:file_path) { 'dir/.rubocop.yml' }

      before do
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            Exclude:
              - vendor/**
        YAML

        create_file(file_path, <<-YAML.strip_indent)
          AllCops:
            Exclude: []
        YAML
      end

      it 'gets AllCops/Exclude from the highest directory level' 

    end

    context 'when a parent file specifies DisabledByDefault: true' do
      let(:file_path) { '.rubocop.yml' }

      before do
        create_file('disable.yml', <<-YAML.strip_indent)
          AllCops:
            DisabledByDefault: true
        YAML

        create_file(file_path, ['inherit_from: disable.yml'])
      end

      it 'disables cops by default' 

    end

    context 'when a file inherits from a parent file' do
      let(:file_path) { 'dir/.rubocop.yml' }

      before do
        create_file('.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            Exclude:
              - vendor/**
              - !ruby/regexp /[A-Z]/
        YAML

        create_file(file_path, ['inherit_from: ../.rubocop.yml'])
      end

      it 'gets an absolute AllCops/Exclude' 


      it 'ignores parent AllCops/Exclude if ignore_parent_exclusion is true' 

    end

    context 'when a file inherits from an empty parent file' do
      let(:file_path) { 'dir/.rubocop.yml' }

      before do
        create_file('.rubocop.yml', [''])

        create_file(file_path, ['inherit_from: ../.rubocop.yml'])
      end

      it 'does not fail to load' 

    end

    context 'when a file inherits from a sibling file' do
      let(:file_path) { 'dir/.rubocop.yml' }

      before do
        create_file('src/.rubocop.yml', <<-YAML.strip_indent)
          AllCops:
            Exclude:
              - vendor/**
        YAML

        create_file(file_path, ['inherit_from: ../src/.rubocop.yml'])
      end

      it 'gets an absolute AllCops/Exclude' 

    end

    context 'when a file inherits and overrides an Exclude' do
      let(:file_path) { '.rubocop.yml' }
      let(:message) do
        '.rubocop.yml: Style/For:Exclude overrides the same parameter in ' \
        '.rubocop_todo.yml'
      end

      before do
        create_file(file_path, <<-YAML.strip_indent)
          inherit_from: .rubocop_todo.yml

          Style/For:
            Exclude:
              - spec/requests/group_invite_spec.rb
        YAML

        create_file('.rubocop_todo.yml', <<-YAML.strip_indent)
          Style/For:
            Exclude:
              - 'spec/models/expense_spec.rb'
              - 'spec/models/group_spec.rb'
        YAML
      end

      it 'gets the Exclude overriding the inherited one with a warning' 

    end

    context 'when inherit_mode is set to merge for Exclude' do
      let(:file_path) { '.rubocop.yml' }

      before do
        create_file(file_path, <<-YAML.strip_indent)
          inherit_from: .rubocop_parent.yml
          inherit_mode:
            merge:
              - Exclude
          AllCops:
            Exclude:
              - spec/requests/expense_spec.rb
          Style/For:
            Exclude:
              - spec/requests/group_invite_spec.rb
        YAML

        create_file('.rubocop_parent.yml', <<-YAML.strip_indent)
          Style/For:
            Exclude:
              - 'spec/models/expense_spec.rb'
              - 'spec/models/group_spec.rb'
        YAML
      end

      it 'unions the two lists of Excludes from the parent and child configs ' \
         'and does not output a warning' do
        expect do
          excludes = configuration_from_file['Style/For']['Exclude']
          expect(excludes.sort)
            .to eq([File.expand_path('spec/requests/group_invite_spec.rb'),
                    File.expand_path('spec/models/expense_spec.rb'),
                    File.expand_path('spec/models/group_spec.rb')].sort)
        end.not_to output(/overrides the same parameter/).to_stdout
      end

      it 'does not merge the default_config' 

    end

    context 'when inherit_mode overrides the global inherit_mode setting' do
      let(:file_path) { '.rubocop.yml' }

      before do
        create_file(file_path, <<-YAML.strip_indent)
          inherit_from: .rubocop_parent.yml
          inherit_mode:
            merge:
              - Exclude

          Style/For:
            Exclude:
              - spec/requests/group_invite_spec.rb

          Style/Dir:
            inherit_mode:
              override:
                - Exclude
            Exclude:
              - spec/requests/group_invite_spec.rb

        YAML

        create_file('.rubocop_parent.yml', <<-YAML.strip_indent)
          Style/For:
            Exclude:
              - 'spec/models/expense_spec.rb'
              - 'spec/models/group_spec.rb'

          Style/Dir:
            Exclude:
              - 'spec/models/expense_spec.rb'
              - 'spec/models/group_spec.rb'
        YAML
      end

      it 'unions the two lists of Excludes from the parent and child configs ' \
          'for cops that do not override the inherit_mode' do
        expect do
          excludes = configuration_from_file['Style/For']['Exclude']
          expect(excludes.sort)
            .to eq([File.expand_path('spec/requests/group_invite_spec.rb'),
                    File.expand_path('spec/models/expense_spec.rb'),
                    File.expand_path('spec/models/group_spec.rb')].sort)
        end.not_to output(/overrides the same parameter/).to_stdout
      end

      it 'overwrites the Exclude from the parent when the cop overrides' \
          'the global inherit_mode' do
        expect do
          excludes = configuration_from_file['Style/Dir']['Exclude']
          expect(excludes)
            .to eq([File.expand_path('spec/requests/group_invite_spec.rb')])
        end.not_to output(/overrides the same parameter/).to_stdout
      end
    end

    context 'when a third party require defines a new gem' do
      before do
        allow(RuboCop::Cop::Cop)
          .to receive(:registry)
          .and_return(
            RuboCop::Cop::Registry.new(RuboCop::Cop::Cop.registry.cops)
          )

        create_file('third_party/gem.rb', <<-RUBY.strip_indent)
          module RuboCop
            module Cop
              module Custom
                class FilePath < Cop
                end
              end
            end
          end
        RUBY

        create_file('.rubocop.yml', <<-YAML.strip_indent)
          Custom/FilePath:
            Enabled: false
        YAML

        create_file('.rubocop_with_require.yml', <<-YAML.strip_indent)
          require: ./third_party/gem
          Custom/FilePath:
            Enabled: false
        YAML
      end

      it 'does not emit a warning' 

    end

    context 'when a file inherits from a parent and grandparent file' do
      let(:file_path) { 'dir/subdir/.rubocop.yml' }

      before do
        create_file('dir/subdir/example.rb', '')

        create_file('.rubocop.yml', <<-YAML.strip_indent)
          Metrics/LineLength:
            Enabled: false
            Max: 77
        YAML

        create_file('dir/.rubocop.yml', <<-YAML.strip_indent)
          inherit_from: ../.rubocop.yml

          Metrics/MethodLength:
            Enabled: true
            CountComments: false
            Max: 10
        YAML

        create_file(file_path, <<-YAML.strip_indent)
          inherit_from: ../.rubocop.yml

          Metrics/LineLength:
            Enabled: true

          Metrics/MethodLength:
            Max: 5
        YAML
      end

      it 'returns the ancestor configuration plus local overrides' 

    end

    context 'when a file inherits from two configurations' do
      let(:file_path) { '.rubocop.yml' }

      before do
        create_file('example.rb', '')

        create_file('normal.yml', <<-YAML.strip_indent)
          Metrics/MethodLength:
            Enabled: false
            CountComments: true
            Max: 80
        YAML

        create_file('special.yml', <<-YAML.strip_indent)
          Metrics/MethodLength:
            Enabled: false
            Max: 200
        YAML

        create_file(file_path, <<-YAML.strip_indent)
          inherit_from:
            - normal.yml
            - special.yml

          Metrics/MethodLength:
            Enabled: true
        YAML
      end

      it 'returns values from the last one when possible' 

    end

    context 'when a file inherits and overrides with non-namedspaced cops' do
      let(:file_path) { '.rubocop.yml' }

      before do
        create_file('example.rb', '')

        create_file('line_length.yml', <<-YAML.strip_indent)
          LineLength:
            Max: 120
        YAML

        create_file(file_path, <<-YAML.strip_indent)
          inherit_from:
            - line_length.yml

          LineLength:
            AllowHeredoc: false
        YAML
      end

      it 'returns includes both of the cop changes' 

    end

    context 'when a file inherits from an expanded path' do
      let(:file_path) { '.rubocop.yml' }

      before do
        create_file('~/.rubocop.yml', [''])
        create_file(file_path, ['inherit_from: ~/.rubocop.yml'])
      end

      it 'does not fail to load expanded path' 

    end

    context 'when a file inherits from an unknown gem' do
      let(:file_path) { '.rubocop.yml' }

      before do
        create_file(file_path, <<-YAML.strip_indent)
          inherit_gem:
            not_a_real_gem: config/rubocop.yml
        YAML
      end

      it 'fails to load' 

    end

    context 'when a file inherits from the rubocop gem' do
      let(:file_path) { '.rubocop.yml' }

      before do
        create_file(file_path, <<-YAML.strip_indent)
          inherit_gem:
            rubocop: config/default.yml
        YAML
      end

      it 'fails to load' 

    end

    context 'when a file inherits from a known gem' do
      let(:file_path) { '.rubocop.yml' }
      let(:gem_root) { 'gems' }

      before do
        create_file("#{gem_root}/gemone/config/rubocop.yml",
                    <<-YAML.strip_indent)
          Metrics/MethodLength:
            Enabled: false
            Max: 200
            CountComments: false
        YAML
        create_file("#{gem_root}/gemtwo/config/default.yml",
                    <<-YAML.strip_indent)
          Metrics/LineLength:
            Enabled: true
        YAML
        create_file("#{gem_root}/gemtwo/config/strict.yml",
                    <<-YAML.strip_indent)
          Metrics/LineLength:
            Max: 72
            AllowHeredoc: false
        YAML
        create_file('local.yml', <<-YAML.strip_indent)
          Metrics/MethodLength:
            CountComments: true
        YAML
        create_file(file_path, <<-YAML.strip_indent)
          inherit_gem:
            gemone: config/rubocop.yml
            gemtwo:
              - config/default.yml
              - config/strict.yml

          inherit_from: local.yml

          Metrics/MethodLength:
            Enabled: true

          Metrics/LineLength:
            AllowURI: false
        YAML
      end

      it 'returns values from the gem config with local overrides' 

    end

    context 'when a file inherits from a url' do
      let(:file_path) { '.rubocop.yml' }
      let(:cache_file) { '.rubocop-http---example-com-rubocop-yml' }

      before do
        stub_request(:get, /example.com/)
          .to_return(status: 200, body: <<-YAML.strip_indent)
            Style/Encoding:
              Enabled: true
            Style/StringLiterals:
              EnforcedStyle: double_quotes
          YAML
        create_file(file_path, <<-YAML.strip_indent)
          inherit_from: http://example.com/rubocop.yml

          Style/StringLiterals:
            EnforcedStyle: single_quotes
        YAML
      end

      after do
        File.unlink cache_file if File.exist? cache_file
      end

      it 'creates the cached file alongside the owning file' 

    end

    context 'when a file inherits from a url inheriting from another file' do
      let(:file_path) { '.robocop.yml' }
      let(:cache_file) { '.rubocop-http---example-com-rubocop-yml' }
      let(:cache_file_2) { '.rubocop-http---example-com-inherit-yml' }

      before do
        stub_request(:get, %r{example.com/rubocop})
          .to_return(status: 200, body: "inherit_from:\n    - inherit.yml")

        stub_request(:get, %r{example.com/inherit})
          .to_return(status: 200, body: "Style/Encoding:\n    Enabled: true")

        create_file(file_path, ['inherit_from: http://example.com/rubocop.yml'])
      end

      after do
        [cache_file, cache_file_2].each do |f|
          File.unlink f if File.exist? f
        end
      end

      it 'downloads the inherited file from the same url and caches it' 

    end

    context 'EnabledByDefault / DisabledByDefault' do
      def cop_enabled?(cop_class)
        configuration_from_file.for_cop(cop_class).fetch('Enabled')
      end

      let(:file_path) { '.rubocop.yml' }

      before do
        create_file(file_path, config)
      end

      context 'when DisabledByDefault is true' do
        let(:config) do
          <<-YAML.strip_indent
            AllCops:
              DisabledByDefault: true
            Style/Copyright:
              Exclude:
              - foo
          YAML
        end

        it 'enables cops that are explicitly in the config file '\
          'even if they are disabled by default' do
          cop_class = RuboCop::Cop::Style::Copyright
          expect(cop_enabled?(cop_class)).to be true
        end

        it 'disables cops that are normally enabled by default' 


        context 'and a department is enabled' do
          let(:config) do
            <<-YAML.strip_indent
              AllCops:
                DisabledByDefault: true
              Style:
                Enabled: true
            YAML
          end

          it 'enables cops in that department' 


          it 'disables cops in other departments' 


          it 'keeps cops that are disabled in default configuration disabled' 

        end

        context 'and the Rails department is enabled' do
          let(:config) do
            <<-YAML.strip_indent
              AllCops:
                DisabledByDefault: true
              Rails:
                Enabled: true
              Rails/ActionFilter:
                EnforcedStyle: filter
            YAML
          end

          it 'enables explicitly mentioned cops in that department' 


          it 'disables unmentioned cops in that department' 

        end

        context 'and the Rails department is disabled' do
          let(:config) do
            <<-YAML.strip_indent
              AllCops:
                DisabledByDefault: true
              Rails:
                Enabled: false
              Rails/ActionFilter:
                Enabled: true
            YAML
          end

          it 'disables explicitly mentioned cops in that department' 


          it 'disables unmentioned cops in that department' 

        end
      end

      context 'when EnabledByDefault is true' do
        let(:config) do
          <<-YAML.strip_indent
            AllCops:
              EnabledByDefault: true
            Layout/TrailingWhitespace:
              Enabled: false
          YAML
        end

        it 'enables cops that are disabled by default' 


        it 'respects cops that are disbled in the config' 

      end
    end
  end

  describe '.load_file', :isolated_environment do
    subject(:load_file) do
      described_class.load_file(configuration_path)
    end

    let(:configuration_path) { '.rubocop.yml' }

    it 'returns a configuration loaded from the passed path' 


    it 'fails with a TypeError when loading a malformed configuration file' 


    it 'changes target ruby version with a patch to float' 


    it 'loads configuration properly when it includes non-ascii characters ' 


    it 'returns an empty configuration loaded from an empty file' 


    context 'when SafeYAML is required' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Style/WordArray:
            WordRegex: !ruby/regexp '/\\A[\\p{Word}]+\\z/'
        YAML
      end

      context 'when it is fully required' do
        it 'de-serializes Regexp class' 

      end

      context 'when safe_yaml is required without monkey patching' do
        it 'de-serializes Regexp class' 


        context 'and SafeYAML.load is private' do
          # According to issue #2935, SafeYAML.load can be private in some
          # circumstances.
          it 'does not raise private method load called for SafeYAML:Module' 

        end
      end
    end

    context 'when the file does not exist' do
      let(:configuration_path) { 'file_that_does_not_exist.yml' }

      it 'prints a friendly (concise) message to stderr and exits' 

    end
  end

  describe '.merge' do
    subject(:merge) { described_class.merge(base, derived) }

    let(:base) do
      {
        'AllCops' => {
          'Include' => ['**/*.gemspec', '**/Rakefile'],
          'Exclude' => []
        }
      }
    end
    let(:derived) do
      { 'AllCops' => { 'Exclude' => ['example.rb', 'exclude_*'] } }
    end

    it 'returns a recursive merge of its two arguments' 

  end

  describe 'configuration for CharacterLiteral', :isolated_environment do
    let(:dir_path) { 'test/blargh' }

    let(:config) do
      config_path = described_class.configuration_file_for(dir_path)
      described_class.configuration_from_file(config_path)
    end

    context 'when .rubocop.yml inherits from a file with a name starting ' \
            'with .rubocop' do
      before do
        create_file('test/.rubocop_rules.yml', <<-YAML.strip_indent)
          Style/CharacterLiteral:
            Exclude:
              - blargh/blah.rb
        YAML
        create_file('test/.rubocop.yml', 'inherit_from: .rubocop_rules.yml')
      end

      it 'gets an Exclude relative to the inherited file converted to ' \
         'absolute' do
        expect(config.for_cop(RuboCop::Cop::Style::CharacterLiteral)['Exclude'])
          .to eq([File.join(Dir.pwd, 'test/blargh/blah.rb')])
      end
    end
  end

  describe 'configuration for AssignmentInCondition' do
    describe 'AllowSafeAssignment' do
      it 'is enabled by default' 

    end
  end

  describe 'when a requirement is defined', :isolated_environment do
    let(:required_file_path) { './required_file.rb' }

    before do
      create_file('.rubocop.yml', ['require:', "  - #{required_file_path}"])
      create_file(required_file_path, ['class MyClass', 'end'])
    end

    it 'requires the passed path' 


    it 'uses paths relative to the .rubocop.yml, not cwd' 

  end

  describe 'when a unqualified requirement is defined', :isolated_environment do
    let(:required_file_path) { 'required_file' }

    before do
      create_file('.rubocop.yml', ['require:', "  - #{required_file_path}"])
      create_file(required_file_path + '.rb', ['class MyClass', 'end'])
    end

    it 'works without a starting .' 

  end
end

