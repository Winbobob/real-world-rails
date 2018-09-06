require 'rails_helper'

describe UsernameSettingValidator do
  describe '#valid_value?' do
    subject(:validator) { described_class.new }

    it "returns true for blank values" 


    it "returns true if value matches an existing user's username" 


    it "returns false if value does not match a user's username" 


    context "regex support" do
      let!(:darthvader) { Fabricate(:user, username: 'darthvader') }
      let!(:luke) { Fabricate(:user, username: 'luke') }

      it "returns false if regex doesn't match" 


      it "returns true if regex matches" 


      it "returns false if regex matches but username doesn't match a user" 

    end
  end
end

