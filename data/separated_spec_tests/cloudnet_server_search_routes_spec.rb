require 'rails_helper'

describe "ServerSearchController", :type => :routing do
  context 'when not logged in' do
    it "routes /search to " 

    
    xit "routes / to public controller" do
      request = double("Some Collaborator").as_null_object
      expect(get: '/').to route_to 'public#main'
    end
  end
end

