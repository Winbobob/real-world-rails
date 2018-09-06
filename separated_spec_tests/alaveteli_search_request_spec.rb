# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe "When searching" do

  before(:each) do
    load_raw_emails_data
    get_fixtures_xapian_index
  end

  it "should not strip quotes from quoted query" 


  it "should redirect requests with search in query string to URL-based page" 


  it "should correctly execute simple search" 


  it "should not log a logged-in user out" 


  it "should correctly filter searches for requests" 

  it "should correctly filter searches for users" 


  it "should correctly filter searches for successful requests" 


  it "should correctly filter searches for comments" 


  context 'using JSON format' do

    it 'should return JSON formatted results' 


  end

  it "should search for requests made to a tagged set of public authorities" 


  it 'correctly recognises feed searches' 

end

