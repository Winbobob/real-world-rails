require_relative '../spec_helper'

module Aws
  describe Credentials do

    it 'provides access to the access key id' 


    it 'provides access to the secret access key' 


    it 'provides access to the session tokey' 


    it 'defaults the session token to nil' 


    describe '#set?' do

      it 'returns true when the key and secret are both non nil values' 


      it 'returns false if the key is nil' 


      it 'returns false if the secret is nil' 


      it 'returns false if the key is an empty string' 


      it 'returns false if the secret is an empty string' 


    end
  end
end

