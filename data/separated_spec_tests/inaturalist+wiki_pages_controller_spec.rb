require File.dirname(__FILE__) + '/../spec_helper'

describe WikiPagesController do
  describe "edit" do

    it "should be accessible to curators" 

    describe "admin-only" do
      let(:wiki_page) { WikiPage.make!( admin_only: true ) }
      it "should be accessible to site admins" 

      it "should not be accessible to curators" 

    end
  end
end

