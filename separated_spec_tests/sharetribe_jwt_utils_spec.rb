require 'spec_helper'

describe JWTUtils do

  let(:secret) { SecureRandom.hex(64) }
  let(:payload) { {"test_data" => true} }

  def expect_success(res, claims = {})
    expect(res.success).to eq(true)
    decoded_data, jwt_meta = res.data
    expect(HashUtils.stringify_keys(payload.merge(claims))).to eq(decoded_data)
  end

  def expect_failure(res, error)
    expect(res.success).to eq(false)
    expect(res[:data]).to eq(error)
  end

  describe "VerificationError" do
    it "success" 


    it "failure" 


    it "throws if secret is empty" 

  end

  describe "ExpiredSignature" do
    it "success" 


    it "failure" 

  end

  describe "InvalidSubError" do
    it "success" 


    it "failure" 

  end
end

