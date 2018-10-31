require 'spec_helper'

describe ApplicationController do

  describe "UnknownFormat" do
    # testing a feature implemented in the ApplicationController by using
    # the ObservationsController since there are no testable public-facing
    # actions in the ApplicationController
    describe ObservationsController do
      render_views
      before(:all) { Observation.destroy_all }
      before(:each) { enable_elastic_indexing( Observation ) }
      after(:each) { disable_elastic_indexing( Observation ) }

      it "render the 404 page for unknown formats" 

    end
  end

  describe "set_locale" do
    it "should set the session locale" 


    it "should do nothing for unknown locales" 


    it "should update logged in users' locales" 

  end

  describe "ping" do
    it "returns json" 

  end

  describe WelcomeController do
    describe "check_user_last_active" do
      it "re-activate inactive users" 

    end

    describe "draft sites" do
      let(:site) { Site.make!(draft: true) }
      let(:basic_user) { User.make! }
      let(:admin_user) { make_admin }
      let(:site_admin_user) {
        u = User.make!
        SiteAdmin.create(site: site, user: u)
        u
      }

      it "does not redirect users on the main site" 


      it "redirects logged-out users to log in" 


      it "redirects basic users to log in" 


      it "does not redirect admins" 


      it "does not redirect site admins" 

    end

  end

end

