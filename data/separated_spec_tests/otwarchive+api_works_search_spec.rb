# frozen_string_literal: true
require "spec_helper"
require "controllers/api/api_helper"

include ApiHelper

def post_search_result(valid_params)
  post "/api/v2/works/search", params: valid_params.to_json, headers: valid_headers
  JSON.parse(response.body, symbolize_names: true)
end

describe "API v2 WorksController - Search", type: :request do
  describe "valid work URL request" do
    work = FactoryGirl.create(:posted_work, imported_from_url: "foo")
    
    it "returns 200 OK" 

  
    it "returns the work URL for an imported work" 

  
    it "returns the original reference if one was provided" 

  
    it "returns an error when no works are provided" 

    
    it "returns an error when no URLs are provided" 

  
    it "returns an error when too many works are provided" 

    
    it "returns an error when too many URLs are provided" 

  
    it "returns a not found message for a work that wasn't found" 

  
    it "only does an exact match on the original url" 

  end
end

