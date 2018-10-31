require File.dirname(__FILE__) + '/../spec_helper'

describe SiteAdminsController do
  let(:site) { Site.make! }

  describe "create" do
    it "allows admins to create" 


    it "does not allow non-users to create" 


    it "does not allow regular users to create" 


    it "does not allow curators to create" 

  end

  describe "destroy" do
    let!(:site_admin) { SiteAdmin.make! }

    it "allows admins to destroy by ID" 


    it "allows admins to destroy by user_id and site_id" 


    it "does not allow admins to destroy with only user_id or only site_id" 


    it "does not allow non-users to destroy" 


    it "does not allow regular users to destroy" 


    it "does not allow curators to destroy" 

  end

end

