# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe AspectMembershipsController, type: :controller do
  before do
    @aspect0  = alice.aspects.first
    @aspect1  = alice.aspects.create(name: "another aspect")
    @aspect2  = bob.aspects.first

    @contact = alice.contact_for(bob.person)
    alice.getting_started = false
    alice.save
    sign_in alice, scope: :user
    allow(@controller).to receive(:current_user).and_return(alice)
    request.env["HTTP_REFERER"] = "http://" + request.host
  end

  describe "#create" do
    before do
      @person = eve.person
    end

    it "succeeds" 


    it "creates an aspect membership" 


    it "creates a contact" 


    it "does not 500 on a duplicate key error" 


    context "json" do
      it "returns the aspect membership" 


      it "responds with an error message when the request failed" 

    end
  end

  describe "#destroy" do
    it "removes contacts from an aspect" 


    it "aspect membership does not exist" 

  end
end

