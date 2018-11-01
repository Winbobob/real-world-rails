# frozen_string_literal: true

RSpec.describe RuboCop::Config do
  include FileHelper

  subject(:configuration) { described_class.new(hash, loaded_path) }

  let(:hash) { {} }
  let(:loaded_path) { 'example/.rubocop.yml' }

  describe '#validate', :isolated_environment do
    subject(:configuration) do
      RuboCop::ConfigLoader.load_file(configuration_path)
    end

    let(:configuration_path) { '.rubocop.yml' }

    context 'when the configuration includes any unrecognized cop name' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          LyneLenth:
            Enabled: true
            Max: 100
        YAML
        $stderr = StringIO.new
      end

      after do
        $stderr = STDERR
      end

      it 'prints a warning message' 

    end

    context 'when the configuration includes an empty section' do
      before do
        create_file(configuration_path, ['Metrics/LineLength:'])
      end

      it 'raises validation error' 

    end

    context 'when the empty section is AllCops' do
      before do
        create_file(configuration_path, ['AllCops:'])
      end

      it 'raises validation error' 

    end

    context 'when the configuration is in the base RuboCop config folder' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          InvalidProperty:
            Enabled: true
        YAML
        stub_const('RuboCop::ConfigLoader::RUBOCOP_HOME', rubocop_home_path)
      end

      let(:rubocop_home_path) { File.realpath('.') }
      let(:configuration_path) { 'config/.rubocop.yml' }

      it 'is not validated' 

    end

    context 'when the configuration includes any unrecognized parameter' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Metrics/LineLength:
            Enabled: true
            Min: 10
        YAML
        $stderr = StringIO.new
      end

      after do
        $stderr = STDERR
      end

      it 'prints a warning message' 

    end

    context 'when the configuration includes any common parameter' do
      # Common parameters are parameters that are not in the default
      # configuration, but are nonetheless allowed for any cop.
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Metrics/ModuleLength:
            Exclude:
              - lib/file.rb
            Include:
              - lib/file.xyz
            Severity: warning
            StyleGuide: https://example.com/some-style.html
        YAML
      end

      it 'does not raise validation error' 

    end

    context 'when the configuration includes a valid EnforcedStyle' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Style/AndOr:
            EnforcedStyle: conditionals
        YAML
      end

      it 'does not raise validation error' 

    end

    context 'when the configuration includes an invalid EnforcedStyle' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Style/AndOr:
            EnforcedStyle: itisinvalid
        YAML
      end

      it 'raises validation error' 

    end

    context 'when the configuration includes a valid EnforcedStyle' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Layout/SpaceAroundBlockParameters:
            EnforcedStyleInsidePipes: space
        YAML
      end

      it 'does not raise validation error' 

    end

    context 'when the configuration includes an invalid EnforcedStyle' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Layout/SpaceAroundBlockParameters:
            EnforcedStyleInsidePipes: itisinvalid
        YAML
      end

      it 'raises validation error' 

    end

    context 'when the configuration includes an obsolete cop' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Style/MethodCallParentheses:
            Enabled: true
        YAML
      end

      it 'raises validation error' 

    end

    context 'when the configuration includes an obsolete parameter' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Rails/UniqBeforePluck:
            EnforcedMode: conservative
        YAML
      end

      it 'raises validation error' 

    end

    shared_examples 'obsolete MaxLineLength parameter' do |cop_name|
      context "when the configuration includes the obsolete #{cop_name}: " \
              'MaxLineLength parameter' do
        before do
          create_file(configuration_path, <<-YAML.strip_indent)
            #{cop_name}:
              MaxLineLength: 100
          YAML
        end

        it 'raises validation error' 

      end
    end

    include_examples 'obsolete MaxLineLength parameter',
                     'Style/WhileUntilModifier'
    include_examples 'obsolete MaxLineLength parameter',
                     'Style/IfUnlessModifier'

    context 'when the configuration includes obsolete parameters and cops' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          Rails/UniqBeforePluck:
            EnforcedMode: conservative
          Style/MethodCallParentheses:
            Enabled: false
          Layout/BlockAlignment:
            AlignWith: either
          Layout/SpaceBeforeModifierKeyword:
            Enabled: false
        YAML
      end

      it 'raises validation error' 

    end

    context 'when all cops are both Enabled and Disabled by default' do
      before do
        create_file(configuration_path, <<-YAML.strip_indent)
          AllCops:
            EnabledByDefault: true
            DisabledByDefault: true
        YAML
      end

      it 'raises validation error' 

    end

    context 'when the configuration includes Lint/Syntax cop' do
      before do
        # Force reloading default configuration
        RuboCop::ConfigLoader.default_configuration = nil
      end

      context 'when the configuration matches the default' do
        before do
          create_file(configuration_path, <<-YAML.strip_indent)
            Lint/Syntax:
              Enabled: true
          YAML
        end

        it 'does not raise validation error' 

      end

      context 'when the configuration does not match the default' do
        before do
          create_file(configuration_path, <<-YAML.strip_indent)
            Lint/Syntax:
              Enabled: false
          YAML
        end

        it 'raises validation error' 

      end
    end
  end

  describe '#make_excludes_absolute' do
    context 'when config is in root directory' do
      let(:hash) do
        {
          'AllCops' => {
            'Exclude' => [
              'config/environment',
              'spec'
            ]
          }
        }
      end

      before do
        allow(configuration)
          .to receive(:base_dir_for_path_parameters)
          .and_return('/home/foo/project')
        configuration.make_excludes_absolute
      end

      it 'generates valid absolute directory' 

    end

    context 'when config is in subdirectory' do
      let(:hash) do
        {
          'AllCops' => {
            'Exclude' => [
              '../../config/environment',
              '../../spec'
            ]
          }
        }
      end

      before do
        allow(configuration)
          .to receive(:base_dir_for_path_parameters)
          .and_return('/home/foo/project/config/tools')
        configuration.make_excludes_absolute
      end

      it 'generates valid absolute directory' 

    end
  end

  describe '#file_to_include?' do
    let(:hash) do
      {
        'AllCops' => {
          'Include' => ['**/Gemfile', 'config/unicorn.rb.example']
        }
      }
    end

    let(:loaded_path) { '/home/foo/project/.rubocop.yml' }

    context 'when the passed path matches any of patterns to include' do
      it 'returns true' 

    end

    context 'when the passed path does not match any of patterns to include' do
      it 'returns false' 

    end
  end

  describe '#file_to_exclude?' do
    before { $stderr = StringIO.new }

    after { $stderr = STDERR }

    let(:hash) do
      {
        'AllCops' => {
          'Exclude' => [
            "#{Dir.pwd}/log/**/*",
            '**/bar.rb'
          ]
        }
      }
    end

    let(:loaded_path) { '/home/foo/project/.rubocop.yml' }

    context 'when the passed path matches any of patterns to exclude' do
      it 'returns true' 

    end

    context 'when the passed path does not match any of patterns to exclude' do
      it 'returns false' 

    end
  end

  describe '#allowed_camel_case_file?' do
    subject { configuration.allowed_camel_case_file?(file_path) }

    let(:hash) do
      {
        'AllCops' => {
          'Include' => ['**/Gemfile']
        }
      }
    end

    context 'when the passed path matches allowed camel case patterns ' \
            'to include' do
      let(:file_path) { '/home/foo/project/Gemfile' }

      it { is_expected.to be true }
    end

    context 'when the passed path does not match allowed camel case patterns ' \
            'to include' do
      let(:file_path) { '/home/foo/project/testCase' }

      it { is_expected.to be false }
    end

    context 'when the passed path is a gemspec' do
      let(:file_path) { '/home/foo/project/my-project.gemspec' }

      it { is_expected.to be true }
    end
  end

  describe '#patterns_to_include' do
    subject(:patterns_to_include) do
      configuration = described_class.new(hash, loaded_path)
      configuration.patterns_to_include
    end

    let(:loaded_path) { 'example/.rubocop.yml' }

    context 'when config file has AllCops => Include key' do
      let(:hash) do
        {
          'AllCops' => {
            'Include' => ['**/Gemfile', 'config/unicorn.rb.example']
          }
        }
      end

      it 'returns the Include value' 

    end
  end

  describe '#possibly_include_hidden?' do
    subject(:configuration) do
      described_class.new(hash, loaded_path)
    end

    let(:loaded_path) { 'example/.rubocop.yml' }

    it 'returns true when Include config only includes regular paths' 


    it 'returns true when Include config includes a regex' 


    it 'returns true when Include config includes a toplevel dotfile' 


    it 'returns true when Include config includes a dotfile in a path' 

  end

  describe '#patterns_to_exclude' do
    subject(:patterns_to_exclude) do
      configuration = described_class.new(hash, loaded_path)
      configuration.patterns_to_exclude
    end

    let(:loaded_path) { 'example/.rubocop.yml' }

    context 'when config file has AllCops => Exclude key' do
      let(:hash) do
        {
          'AllCops' => {
            'Exclude' => ['log/*']
          }
        }
      end

      it 'returns the Exclude value' 

    end
  end

  describe '#check' do
    subject(:configuration) do
      described_class.new(hash, loaded_path)
    end

    let(:loaded_path) { 'example/.rubocop.yml' }

    context 'when a deprecated configuration is detected' do
      let(:hash) { { 'AllCops' => { 'Includes' => [] } } }

      before { $stderr = StringIO.new }

      after { $stderr = STDERR }

      it 'prints a warning message for the loaded path' 

    end
  end

  describe '#deprecation_check' do
    context 'when there is no AllCops configuration' do
      let(:hash) { {} }

      it 'does not yield' 

    end

    context 'when there is AllCops configuration' do
      context 'if there are no Excludes or Includes keys' do
        let(:hash) { { 'AllCops' => { 'Exclude' => [], 'Include' => [] } } }

        it 'does not yield' 

      end

      context 'if there are is an Includes key' do
        let(:hash) { { 'AllCops' => { 'Includes' => [] } } }

        it 'yields' 

      end

      context 'if there are is an Excludes key' do
        let(:hash) { { 'AllCops' => { 'Excludes' => [] } } }

        it 'yields' 

      end
    end
  end

  context 'whether the cop is enabled' do
    def cop_enabled(cop_class)
      configuration.for_cop(cop_class).fetch('Enabled')
    end

    context 'when an entire cop department is disabled' do
      context 'but an individual cop is enabled' do
        let(:hash) do
          {
            'Layout' => { 'Enabled' => false },
            'Layout/TrailingWhitespace' => { 'Enabled' => true }
          }
        end

        it 'still disables the cop' 

      end
    end

    context 'when an entire cop department is enabled' do
      context 'but an individual cop is disabled' do
        let(:hash) do
          {
            'Style' => { 'Enabled' => true },
            'Layout/TrailingWhitespace' => { 'Enabled' => false }
          }
        end

        it 'still disables the cop' 

      end
    end

    context 'when a cop has configuration but no explicit Enabled setting' do
      let(:hash) do
        {
          'Layout/TrailingWhitespace' => { 'Exclude' => ['foo'] }
        }
      end

      it 'enables the cop by default' 

    end
  end

  describe '#target_rails_version' do
    context 'when TargetRailsVersion is set' do
      let(:hash) do
        {
          'AllCops' => {
            'TargetRailsVersion' => rails_version
          }
        }
      end

      context 'with patch version' do
        let(:rails_version) { '5.1.4' }
        let(:rails_version_to_f) { 5.1 }

        it 'truncates the patch part and converts to a float' 

      end

      context 'correctly' do
        let(:rails_version) { 4.0 }

        it 'uses TargetRailsVersion' 

      end
    end

    context 'when TargetRailsVersion is not set', :isolated_environment do
      let(:hash) do
        {
          'AllCops' => {}
        }
      end

      context 'and lock files do not exist' do
        it 'uses the default rails version' 

      end

      ['Gemfile.lock', 'gems.locked'].each do |file_name|
        context "and #{file_name} exists" do
          let(:base_path) { configuration.base_dir_for_path_parameters }
          let(:lock_file_path) { File.join(base_path, file_name) }

          it "uses the single digit Rails version in #{file_name}" 


          it "uses the multi digit Rails version in #{file_name}" 


          it "does not use the DEPENDENCIES Rails version in #{file_name}" 


          it "uses the default Rails when Rails is not in #{file_name}" 

        end
      end
    end
  end

  describe '#target_ruby_version', :isolated_environment do
    context 'when TargetRubyVersion is set' do
      let(:ruby_version) { 2.2 }

      let(:hash) do
        {
          'AllCops' => {
            'TargetRubyVersion' => ruby_version
          }
        }
      end

      before do
        allow(File).to receive(:file?).and_call_original
      end

      it 'uses TargetRubyVersion' 


      it 'does not read .ruby-version' 


      it 'does not read Gemfile.lock or gems.locked' 

    end

    context 'when TargetRubyVersion is not set' do
      context 'when .ruby-version is present' do
        before do
          dir = configuration.base_dir_for_path_parameters
          create_file(File.join(dir, '.ruby-version'), ruby_version)
        end

        context 'when .ruby-version contains an MRI version' do
          let(:ruby_version) { '2.2.4' }
          let(:ruby_version_to_f) { 2.2 }

          it 'reads it to determine the target ruby version' 

        end

        context 'when the MRI version contains multiple digits' do
          let(:ruby_version) { '10.11.0' }
          let(:ruby_version_to_f) { 10.11 }

          it 'reads it to determine the target ruby version' 

        end

        context 'when .ruby-version contains a version prefixed by "ruby-"' do
          let(:ruby_version) { 'ruby-2.3.0' }
          let(:ruby_version_to_f) { 2.3 }

          it 'correctly determines the target ruby version' 

        end

        context 'when .ruby-version contains a JRuby version' do
          let(:ruby_version) { 'jruby-9.1.2.0' }

          it 'uses the default target ruby version' 

        end

        context 'when .ruby-version contains a Rbx version' do
          let(:ruby_version) { 'rbx-3.42' }

          it 'uses the default target ruby version' 

        end

        context 'when .ruby-version contains "system" version' do
          let(:ruby_version) { 'system' }

          it 'uses the default target ruby version' 

        end

        it 'does not read Gemfile.lock or gems.locked' 

      end

      context 'when .ruby-version is not present' do
        ['Gemfile.lock', 'gems.locked'].each do |file_name|
          context "and #{file_name} exists" do
            let(:base_path) { configuration.base_dir_for_path_parameters }
            let(:lock_file_path) { File.join(base_path, file_name) }

            it "uses MRI Ruby version when it is present in #{file_name}" 


            it 'uses MRI Ruby version when it has multiple digits' 


            it "uses the default Ruby when Ruby is not in #{file_name}" 


            it "uses the default Ruby when rbx is in #{file_name}" 


            it "uses the default Ruby when jruby is in #{file_name}" 

          end
        end

        context 'when bundler lock files are not present' do
          it 'uses the default target ruby version' 

        end
      end

      context 'when .ruby-version is in a parent directory' do
        before do
          dir = configuration.base_dir_for_path_parameters
          create_file(File.join(dir, '..', '.ruby-version'), '2.4.1')
        end

        it 'reads it to determine the target ruby version' 

      end

      context 'when .ruby-version is not in a parent directory' do
        ['Gemfile.lock', 'gems.locked'].each do |file_name|
          context "when #{file_name} is in a parent directory" do
            it 'does' 

          end
        end
      end
    end
  end
end

