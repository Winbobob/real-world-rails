require 'rails_helper'

describe Admin::ApiController do

  it "is a subclass of AdminController" 


  let(:admin) { Fabricate(:admin) }

  context "as an admin" do
    before do
      sign_in(admin)
    end

    describe '#index' do
      it "succeeds" 

    end

    describe '#regenerate_key' do
      let(:api_key) { Fabricate(:api_key) }

      it "returns 404 when there is no key" 


      it "delegates to the api key's `regenerate!` method" 

    end

    describe '#revoke_key' do
      let(:api_key) { Fabricate(:api_key) }

      it "returns 404 when there is no key" 


      it "delegates to the api key's `regenerate!` method" 

    end
  end

  describe '#create_master_key' do
    it "creates a record" 


    it "doesn't allow moderators to create master keys" 


  end
end

