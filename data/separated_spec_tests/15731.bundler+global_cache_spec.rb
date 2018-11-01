# frozen_string_literal: true

RSpec.describe "global gem caching" do
  before { bundle! "config global_gem_cache true" }

  describe "using the cross-application user cache" do
    let(:source)  { "http://localgemserver.test" }
    let(:source2) { "http://gemserver.example.org" }

    def source_global_cache(*segments)
      home(".bundle", "cache", "gems", "localgemserver.test.80.dd34752a738ee965a2a4298dc16db6c5", *segments)
    end

    def source2_global_cache(*segments)
      home(".bundle", "cache", "gems", "gemserver.example.org.80.1ae1663619ffe0a3c9d97712f44c705b", *segments)
    end

    it "caches gems into the global cache on download" 


    it "uses globally cached gems if they exist" 


    describe "when the same gem from different sources is installed" do
      it "should use the appropriate one from the global cache" 


      it "should not install if the wrong source is provided" 

    end

    describe "when installing gems from a different directory" do
      it "uses the global cache as a source" 

    end
  end

  describe "extension caching", :rubygems => "2.2" do
    it "works" 

  end
end

