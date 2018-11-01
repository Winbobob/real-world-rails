require 'rails_helper'
require_dependency 'url_helper'

describe UrlHelper do

  describe "#is_local" do

    it "is true when the file has been uploaded" 


    it "is true for relative assets" 


    it "is true for plugin assets" 


  end

  describe "#absolute" do

    it "returns an absolute URL for CDN" 


    it "does not change non-relative url" 


    it "changes a relative url to an absolute one using base url by default" 


    it "changes a relative url to an absolute one using the cdn when enabled" 


  end

  describe "#absolute_without_cdn" do

    it "changes a relative url to an absolute one using base url even when cdn is enabled" 


  end

  describe "#schemaless" do

    it "removes http schemas only" 


  end

  describe "#escape_uri" do
    it "doesn't escape simple URL" 


    it "escapes unsafe chars" 


    it "escapes non-ascii chars" 


    it "doesn't escape already escaped chars" 

  end

end

