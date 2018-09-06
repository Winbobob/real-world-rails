# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UriRegexp do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using `URI.regexp` with argument' 


  it 'registers an offense when using `::URI.regexp` with argument' 


  it 'registers an offense when using `URI.regexp` without argument' 


  it 'registers an offense when using `::URI.regexp` without argument' 


  it "autocorrects URI::DEFAULT_PARSER.make_regexp('http://example.com')" 


  it "autocorrects ::URI::DEFAULT_PARSER.make_regexp('http://example.com')" 


  it 'autocorrects URI::DEFAULT_PARSER.make_regexp' 


  it 'autocorrects ::URI::DEFAULT_PARSER.make_regexp' 

end

