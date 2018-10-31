require File.dirname(__FILE__) + '/../spec_helper'

describe TeamboxDatasController do
  route_matches("/datas/22/download", 
    :get, 
    :controller => "teambox_datas", 
    :action => "download", 
    :id => "22")
  
  describe "#download" do
    it "should send data" 

  end
end  

