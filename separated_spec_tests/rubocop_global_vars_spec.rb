# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::GlobalVars, :config do
  cop_config = {
    'AllowedVariables' => ['$allowed']
  }

  subject(:cop) { described_class.new(config) }

  let(:cop_config) { cop_config }

  it 'registers an offense for $custom' 


  it 'allows user whitelisted variables' 


  described_class::BUILT_IN_VARS.each do |var|
    it "does not register an offense for built-in variable #{var}" 

  end

  it 'does not register an offense for backrefs like $1' 

end

