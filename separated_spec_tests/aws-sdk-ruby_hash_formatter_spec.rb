require_relative '../spec_helper'

module AwsSdkCodeGenerator
  describe HashFormatter do

    it 'can serialize an empty hash' 


    it 'can serialize an empty hash to an empty string' 


    it 'can serialize a simple hash' 


    it 'can auto-quote strings' 


    it 'leaves indentation when not wrapping' 


    it 'can serialize a simple hash inline' 


    it 'can omit curly braces' 


    it 'can inline and omit curly braces' 


    it 'serializes hashes with a single complex on a separate line' 


    it 'puts multiple hash values on different lines' 


    it 'can serialize nested hashes' 


    it 'supports hashes with string keys' 


    it 'can serialize empty lists' 


    it 'serializes arrays with 1 scalar element on a single line' 


    it 'serializes arrays with multiple scalar element on multiple lines' 


    it 'serializes arrays with 1 complex element on multiple lines' 


    it 'serializes arrays with 1 complex element on multiple lines' 


    it 'serializes simple hashes each on their own line in arrays' 


    it 'serializes multi-line hashes separately in arrays' 


    it 'raises an error for non-String scalars' 


  end
end

