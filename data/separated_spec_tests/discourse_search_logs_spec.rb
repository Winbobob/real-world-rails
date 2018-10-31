require 'rails_helper'

RSpec.describe Admin::SearchLogsController do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  before do
    SearchLog.log(term: 'ruby', search_type: :header, ip_address: '127.0.0.1')
  end

  after do
    SearchLog.clear_debounce_cache!
  end

  context "#index" do
    it "raises an error if you aren't logged in" 


    it "raises an error if you aren't an admin" 


    it "should work if you are an admin" 

  end

  context "#term" do
    it "raises an error if you aren't logged in" 


    it "raises an error if you aren't an admin" 


    it "should work if you are an admin" 

  end
end

