require 'tempfile'

describe 'isolating code to a sub process' do
  it 'isolates the block from the main process' 


  if Process.respond_to?(:fork) && !(RUBY_PLATFORM == 'java' && RUBY_VERSION == '1.8.7')

    it 'returns the result of sub process' 


    it 'returns a UnmarshableObject if the result of sub process cannot be marshaled' 


    it 'captures and reraises errors to the main process' 


    it 'captures and reraises test failures' 


    it 'fails if the sub process generates warnings' 


  else

    it 'pends the block' 


  end
end

