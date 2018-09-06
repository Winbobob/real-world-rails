require 'spec_helper'

describe TokenService do
  let(:expire_in_future) { DateTime.new(2100, 01, 20, 10, 0, 0) }
  let(:expire_in_past) { DateTime.new(2013, 01, 20, 10, 0, 0) }

  describe '#generate_token' do
    it 'should generate a token and store the token digest in the database' 


    it 'should store only one token for the same path and entity' 


  end

  describe '#valid?' do
    it 'should return true if valid token is provided' 


    it 'should return false if the token is not correct' 


    it 'should return false if the path is not correct' 


    it 'should return false if the entity is not correct' 



    it 'should return true if token valid but expired' 



    it 'should be valid only the last token generated given a path, entity' 

  end

  describe '#expired?' do
    it 'should return false if expiry time is in the future' 


    it 'should return true if expiry date is in the past' 

  end



  describe '#delete_expired' do
    it 'should delete expired tokens' 

  end
end

