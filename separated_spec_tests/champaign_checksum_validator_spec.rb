# frozen_string_literal: true

require 'rails_helper'

describe CallTool::ChecksumValidator do
  describe 'validate' do
    before :each do
      allow(Digest::SHA256).to receive(:hexdigest).and_return('a1b2c3d4e5')
    end

    subject { CallTool::ChecksumValidator }
    let(:phone) { '+1 213-555-1234' }
    let(:checksum) { 'a1b2c3' }

    it 'returns true if all properties are present and the checksum matches' 


    it 'returns false if any of the three arguments is blank' 


    it 'returns false if the checksum does not match the expected' 


    it 'includes the secret key in the hash' 

  end
end

