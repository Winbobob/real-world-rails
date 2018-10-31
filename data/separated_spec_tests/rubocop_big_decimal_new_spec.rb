# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::BigDecimalNew do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using `BigDecimal.new()`' 


  it 'registers an offense when using `::BigDecimal.new()`' 


  it 'does not register an offense when using `BigDecimal()`' 


  it 'autocorrects `BigDecimal()`' 

end

