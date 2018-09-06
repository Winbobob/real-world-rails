# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::StringHashKeys do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using strings as keys' 


  it 'registers an offense when using strings as keys mixed with other keys' 


  it 'autocorrects strings as keys into symbols' 


  it 'autocorrects strings as keys mixed with other keys into symbols' 


  it 'autocorrects strings as keys into symbols with the correct syntax' 


  it 'does not register an offense when not using strings as keys' 


  it 'does not register an offense when string key is used in IO.popen' 


  it 'does not register an offense when string key is used in Open3.capture3' 


  it 'does not register an offense when string key is used in Open3.pipeline' 

end

