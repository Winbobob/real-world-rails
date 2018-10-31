# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UriEscapeUnescape do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it "registers an offense when using `URI.escape('http://example.com')`" 


  it "registers an offense when using `URI.escape('@?@!', '!?')`" 


  it "registers an offense when using `::URI.escape('http://example.com')`" 


  it "registers an offense when using `URI.encode('http://example.com')`" 


  it "registers an offense when using `::URI.encode('http://example.com)`" 


  it 'registers an offense when using `URI.unescape(enc_uri)`' 


  it 'registers an offense when using `::URI.unescape(enc_uri)`' 


  it 'registers an offense when using `URI.decode(enc_uri)`' 


  it 'registers an offense when using `::URI.decode(enc_uri)`' 

end

