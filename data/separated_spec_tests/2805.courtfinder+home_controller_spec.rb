require 'spec_helper'

describe HomeController do
  render_views

  let!(:court) { create(:court, old_id: 1, name: "A court of LAW") }

  context "landing page" do
    it "displays the landing page" 

  end

  context "legacy url redirection" do
    it "redirects by court_id" 


    it "redirects to a legacy formfinder leaflet" 


    it "redirects to a legacy formfinder form" 

  end
end

