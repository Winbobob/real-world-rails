require 'spec_helper'

RSpec.describe DocumentsHelper, :type => :helper do
  describe "#metadata" do
    before do
      @user = FactoryBot.build_stubbed(:user, first_name: "User", last_name: nil)
      @document = FactoryBot.build_stubbed(:document, user: @user)
    end
    
    it "should return metadata of the newly created document" 

    
    it "should return metadata of the latest version of the document" 

  end
end

