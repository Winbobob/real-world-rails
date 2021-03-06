# frozen_string_literal: true

RSpec.describe 'RuboCop Project', type: :feature do
  let(:cop_names) do
    RuboCop::Cop::Cop
      .registry
      .without_department(:Test)
      .without_department(:InternalAffairs)
      .cops
      .map(&:cop_name)
  end

  shared_context 'configuration file' do |config_path|
    subject(:config) { RuboCop::ConfigLoader.load_file(config_path) }

    let(:configuration_keys) { config.keys }
    let(:raw_configuration) { config.to_h.values }
  end

  describe 'default configuration file' do
    include_context 'configuration file', 'config/default.yml'

    it 'has configuration for all cops' 


    it 'has a nicely formatted description for all cops' 


    it 'sorts configuration keys alphabetically' 


    it 'has a SupportedStyles for all EnforcedStyle ' \
      'and EnforcedStyle is valid' do
      errors = []
      cop_names.each do |name|
        enforced_styles = config[name]
                          .select { |key, _| key.start_with?('Enforced') }
        enforced_styles.each_key do |style_name|
          supported_key = RuboCop::Cop::Util.to_supported_styles(style_name)
          valid = config[name][supported_key]
          errors.push("#{supported_key} is missing for #{name}") unless valid
        end
      end

      raise errors.join("\n") unless errors.empty?
    end
  end

  describe 'cop message' do
    let(:cops) { RuboCop::Cop::Cop.all }

    it 'end with a period or a question mark' 

  end

  describe 'changelog' do
    subject(:changelog) do
      path = File.join(File.dirname(__FILE__), '..', 'CHANGELOG.md')
      File.read(path)
    end

    it 'has newline at end of file' 


    it 'has link definitions for all implicit links' 


    describe 'entry' do
      subject(:entries) { lines.grep(/^\*/).map(&:chomp) }

      let(:lines) { changelog.each_line }

      it 'has a whitespace between the * and the body' 


      context 'after version 0.14.0' do
        let(:lines) do
          changelog.each_line.take_while do |line|
            !line.start_with?('## 0.14.0')
          end
        end

        it 'has a link to the contributors at the end' 

      end

      describe 'link to related issue' do
        let(:issues) do
          entries.map do |entry|
            entry.match(/\[(?<number>[#\d]+)\]\((?<url>[^\)]+)\)/)
          end.compact
        end

        it 'has an issue number prefixed with #' 


        it 'has a valid URL' 


        it 'has a colon and a whitespace at the end' 

      end

      describe 'contributor name' do
        subject(:contributor_names) { lines.grep(/\A\[@/).map(&:chomp) }

        it 'has a unique contributor name' 

      end

      describe 'body' do
        let(:bodies) do
          entries.map do |entry|
            entry
              .gsub(/`[^`]+`/, '``')
              .sub(/^\*\s*(?:\[.+?\):\s*)?/, '')
              .sub(/\s*\([^\)]+\)$/, '')
          end
        end

        it 'does not start with a lower case' 


        it 'ends with a punctuation' 

      end
    end
  end

  describe 'requiring all of `lib` with verbose warnings enabled' do
    it 'emits no warnings' 

  end
end

