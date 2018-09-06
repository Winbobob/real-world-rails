# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::UriDefaultParser do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using `URI::Parser.new`' 


  it 'registers an offense when using `::URI::Parser.new`' 


  it 'autocorrects `URI::DEFAULT_PARSER`' 


  it 'autocorrects `::URI::DEFAULT_PARSER`' 

end

