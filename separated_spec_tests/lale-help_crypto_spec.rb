require 'rails_helper'

describe Crypto do
  let(:string) { "This is a test string" }

  let(:encrypted) { Crypto::Encryptor.new.process(string) }

  it "can encrypt and decrypt things" 


  it "cannot decrypt things with the wrong encryption details" 


  context "encrypted.details" do
    it "has a the required information" 

  end
end

