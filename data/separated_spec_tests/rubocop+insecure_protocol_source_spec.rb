# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Bundler::InsecureProtocolSource do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using `source :gemcutter`' 


  it 'registers an offense when using `source :rubygems`' 


  it 'registers an offense when using `source :rubyforge`' 


  it 'autocorrects `source :gemcutter`' 


  it 'autocorrects `source :rubygems`' 


  it 'autocorrects `source :rubyforge`' 

end

