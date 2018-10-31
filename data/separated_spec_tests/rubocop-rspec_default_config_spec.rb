RSpec.describe 'config/default.yml' do
  subject(:default_config) do
    RuboCop::ConfigLoader.load_file('config/default.yml')
  end

  let(:cop_names) do
    namespaces = {
      'rspec' => 'RSpec',
      'capybara' => 'Capybara',
      'factory_bot' => 'FactoryBot',
      'rails' => 'Rails'
    }
    glob = SpecHelper::ROOT.join('lib', 'rubocop', 'cop', 'rspec',
                                 '{,capybara,factory_bot,rails}', '*.rb')
    cop_names =
      Pathname.glob(glob).map do |file|
        file_name = file.basename('.rb').to_s
        cop_name  = file_name.gsub(/(^|_)(.)/) { Regexp.last_match(2).upcase }
        namespace = namespaces[file.dirname.basename.to_s]
        "#{namespace}/#{cop_name}"
      end

    cop_names - %w[RSpec/Cop]
  end

  let(:config_keys) do
    cop_names + %w[AllCops]
  end

  def cop_configuration(config_key)
    cop_names.map do |cop_name|
      cop_config = default_config[cop_name]

      cop_config.fetch(config_key) do
        raise "Expected #{cop_name} to have #{config_key} configuration key"
      end
    end
  end

  it 'has configuration for all cops' 


  it 'has descriptions for all cops' 


  it 'does not have newlines in cop descriptions' 


  it 'ends every description with a period' 


  it 'includes Enabled: true for every cop' 

end

