# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::UnknownEnv, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    {
      'Environments' => %w[
        development
        production
        test
      ]
    }
  end

  it 'registers an offense for typo of environment name' 


  it 'accepts correct environment name' 

end

