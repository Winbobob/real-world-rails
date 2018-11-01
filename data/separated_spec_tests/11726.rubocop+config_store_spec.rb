# frozen_string_literal: true

RSpec.describe RuboCop::ConfigStore do
  subject(:config_store) { described_class.new }

  before do
    allow(RuboCop::ConfigLoader).to receive(:configuration_file_for) do |arg|
      # File tree:
      # file1
      # dir/.rubocop.yml
      # dir/file2
      # dir/subdir/file3
      (arg =~ /dir/ ? 'dir' : '.') + '/.rubocop.yml'
    end
    allow(RuboCop::ConfigLoader)
      .to receive(:configuration_from_file) { |arg| arg }
    allow(RuboCop::ConfigLoader)
      .to receive(:load_file) { |arg| RuboCop::Config.new(arg) }
    allow(RuboCop::ConfigLoader)
      .to receive(:merge_with_default) { |config| "merged #{config.to_h}" }
    allow(RuboCop::ConfigLoader)
      .to receive(:default_configuration).and_return('default config')
  end

  describe '.for' do
    it 'always uses config specified in command line' 


    context 'when no config specified in command line' do
      it 'gets config path and config from cache if available' 


      it 'searches for config path if not available in cache' 


      context 'when --force-default-config option is specified' do
        it 'uses default config without searching for config path' 

      end
    end
  end
end

