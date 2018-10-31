require 'rails_helper'

RSpec.describe FileStore::BaseStore do
  let(:upload) { Fabricate(:upload, id: 9999, sha1: Digest::SHA1.hexdigest('9999')) }

  describe '#get_path_for_upload' do
    it 'should return the right path' 


    describe 'when Upload#extension has not been set' do
      it 'should return the right path' 

    end
  end
end

