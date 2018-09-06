require 'spec_helper'

describe WelcomeController do

  describe "set_homepage_wiki" do
    before(:each) { enable_elastic_indexing(Observation) }
    after(:each) { disable_elastic_indexing(Observation) }
    let( :site ) { Site.default }
    before(:all) do
      @home = WikiPage.make!(path: "home")
      @homeES = WikiPage.make!(path: "eshome")
      @homeFR = WikiPage.make!(path: "frhome")
    end

    it "doesn't set @page if there is no home_page_wiki_path" 


    it "sets @page based on home_page_wiki_path" 


    it "doesn't set @page if the path is wrong" 


    it "sets @page based on home_page_wiki_path_by_locale" 


  end

end

