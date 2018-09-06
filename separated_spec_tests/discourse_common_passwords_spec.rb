require "rails_helper"
require_dependency "common_passwords/common_passwords"

describe CommonPasswords do

  it "the passwords file should exist" 


  describe "#common_password?" do
    before { described_class.stubs(:redis).returns(stub_everything) }

    subject { described_class.common_password? @password }

    it "returns false if password isn't in the common passwords list" 


    it "returns false if password is nil" 


    it "returns false if password is blank" 


    it "returns true if password is in the common passwords list" 

  end

  describe '#password_list' do
    it "loads the passwords file if redis doesn't have it" 


    it "doesn't load the passwords file if redis has it" 


    it "loads the passwords file if redis has an empty list" 

  end

  context "missing password file" do
    it "tolerates it" 

  end
end

