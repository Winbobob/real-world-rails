require 'rails_helper'

describe Admin::ApiController do

  it "is a subclass of AdminController" 


  let!(:user) { log_in(:admin) }

  context '.index' do
    it "succeeds" 

  end

  context '.regenerate_key' do
    let(:api_key) { Fabricate(:api_key) }

    it "returns 404 when there is no key" 


    it "delegates to the api key's `regenerate!` method" 

  end

  context '.revoke_key' do
    let(:api_key) { Fabricate(:api_key) }

    it "returns 404 when there is no key" 


    it "delegates to the api key's `regenerate!` method" 

  end

  context '.create_master_key' do
    it "creates a record" 

  end

end

