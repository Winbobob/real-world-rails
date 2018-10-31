# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Security::YAMLLoad, :config do
  subject(:cop) { described_class.new(config) }

  it 'does not register an offense for YAML.dump' 


  it 'does not register an offense for YAML.load under a different namespace' 


  it 'registers an offense for load with a literal string' 


  it 'registers an offense for a fully qualified ::YAML.load' 


  it 'autocorrects load to safe_load' 

end

