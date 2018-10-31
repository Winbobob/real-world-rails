# frozen_string_literal: true

describe NodeInfoController do
  describe "#jrd" do
    it "responds to JSON" 


    it "returns a JRD" 

  end

  describe "#document" do
    context "invalid version" do
      it "responds with not found" 

    end

    %w(1.0 2.0).each do |version|
      context "version #{version}" do
        it "responds to JSON" 


        it "calls NodeInfoPresenter" 


        it "notes the schema in the content type" 

      end
    end
  end

  describe "#statistics" do
    it "returns a 406 for json format" 


    it "responds to html" 


    it "responds to mobile" 

  end
end

