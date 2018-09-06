require 'spec_helper'

describe Profiles::KeysController do
  let(:user) { create(:user) }

  describe "#get_keys" do
    describe "non existant user" do
      it "does not generally work" 

    end

    describe "user with no keys" do
      it "does generally work" 


      it "renders all keys separated with a new line" 


      it "responds with text/plain content type" 

    end

    describe "user with keys" do
      let!(:key) { create(:key, user: user) }
      let!(:another_key) { create(:another_key, user: user) }
      let!(:deploy_key) { create(:deploy_key, user: user) }

      it "does generally work" 


      it "renders all non deploy keys separated with a new line" 


      it "does not render the comment of the key" 


      it "responds with text/plain content type" 

    end
  end
end

