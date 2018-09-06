require 'spec_helper'

describe SQLUtils do
  class MockConnection
    def quote(str)
      "'" + str.gsub("'", "escaped") + "'"
    end
  end

  it "#ar_quote" 


  it "#quote" 


  it "#quote elements in array" 


  describe "#hash_to_query" do
    it "transforms nested hash to SQL query array" 

  end
end

