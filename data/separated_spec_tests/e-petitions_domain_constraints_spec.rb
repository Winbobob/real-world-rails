require 'rails_helper'

RSpec.describe "domain constraints", type: :routes do
  context "when on the public domain" do
    context "and making a request for a public path" do
      it "is routable" 

    end

    context "and making a request for an admin path" do
      it "is not routeable" 

    end

    context "and making a request for the root path" do
      it "is routable" 

    end
  end

  context "when on the moderate subdomain", admin: true do
    context "and making a request for a public path" do
      it "is not routeable" 

    end

    context "and making a request for an admin path" do
      it "is routable" 

    end

    context "and making a request for the root path" do
      it "is redirected to /admin" 

    end
  end
end

