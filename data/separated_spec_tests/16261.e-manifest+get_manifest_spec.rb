require 'rails_helper'

describe 'GET Manifest' do
  describe 'GET manifest' do
    context 'id param' do
      it 'return the manifest as json' 


      it 'finds by manifest tracking number' 


      it 'sends a 404 when the manifest cannot be found' 

    end

    context 'authorization' do
      it 'allows anyone to view public manifest' 


      it 'allows authenticated user to see their own manifest' 


      it 'disallows anon user from seeing private manifest' 


      it 'disallows authenticated user from seeing manifest created by someone else' 

    end
  end
end

