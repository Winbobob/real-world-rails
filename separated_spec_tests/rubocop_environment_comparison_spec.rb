# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::EnvironmentComparison do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using `Rails.env == production`' 


  it 'autocorrects a string' 


  it 'autocorrects a symbol' 


  it 'does not register an offense when using `#good_method`' 

end

