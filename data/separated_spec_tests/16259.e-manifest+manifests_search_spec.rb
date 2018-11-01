require 'rails_helper'
require "queryparams"

describe "search", elasticsearch: true do
  describe "/search" do
    it "searches all fields by default" 


    it "searches by specific field" 


    it "searched by structured query" 

  end

  def search_for(query)
    es_execute_with_retries 3 do
      get "/api/v0/manifests/search?q=#{query}", nil, set_headers
    end
  end

  def search_for_advanced(query)
    es_execute_with_retries 3 do
      get "/api/v0/manifests/search?#{QueryParams.encode({ aq: query })}", nil, set_headers
    end
  end
end

