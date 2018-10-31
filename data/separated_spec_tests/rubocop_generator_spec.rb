# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Generator do
  subject(:generator) do
    described_class.new(cop_identifier, 'your_id', output: stdout)
  end

  let(:stdout) { StringIO.new }
  let(:cop_identifier) { 'Style/FakeCop' }

  before do
    allow(File).to receive(:write)
  end

  describe '#write_source' do
    it 'generates a helpful source file with the name filled in' 


    it 'refuses to overwrite existing files' 

  end

  describe '#write_spec' do
    it 'generates a helpful starting spec file with the class filled in' 
          it 'registers an offense when using `#bad_method`' 


          it 'does not register an offense when using `#good_method`' 

        end
      SPEC

      generator.write_spec

      expect(File)
        .to have_received(:write)
        .with('spec/rubocop/cop/style/fake_cop_spec.rb', generated_source)
    end

    it 'refuses to overwrite existing files' 

  end

  describe '#todo' do
    it 'provides a checklist for implementing the cop' 

  end

  describe '.new' do
    it 'does not accept an unqualified cop' 

  end

  describe '#inject_config' do
    let(:path) { @path } # rubocop:disable RSpec/InstanceVariable

    around do |example|
      Tempfile.create('rubocop-config.yml') do |file|
        @path = file.path
        example.run
      end
    end

    before do
      IO.write(path, <<-YAML.strip_indent)
        Style/Alias:
          Enabled: true

        Style/Lambda:
          Enabled: true

        Style/SpecialGlobalVars:
          Enabled: true
      YAML
    end

    it 'inserts the cop in alphabetical' 

  end

  describe '#snake_case' do
    it 'converts "Lint" to snake_case' 


    it 'converts "FooBar" to snake_case' 


    it 'converts "RSpec" to snake_case' 

  end

  describe 'compliance with rubocop', :isolated_environment do
    include FileHelper

    around do |example|
      orig_registry = RuboCop::Cop::Cop.registry
      RuboCop::Cop::Cop.instance_variable_set(:@registry,
                                              RuboCop::Cop::Registry.new)
      example.run
      RuboCop::Cop::Cop.instance_variable_set(:@registry, orig_registry)
    end

    before { allow(File).to receive(:write).and_call_original }

    let(:config) do
      config = RuboCop::ConfigStore.new
      path = File.join(RuboCop::ConfigLoader::RUBOCOP_HOME,
                       RuboCop::ConfigLoader::DOTFILE)
      config.options_config = path
      config
    end
    let(:options) { { formatters: [] } }
    let(:runner) { RuboCop::Runner.new(options, config) }

    it 'generates a cop file that has no offense' 


    it 'generates a spec file that has no offense' 

  end
end

