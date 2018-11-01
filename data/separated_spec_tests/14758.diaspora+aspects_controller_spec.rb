# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe AspectsController, :type => :controller do
  before do
    alice.getting_started = false
    alice.save
    sign_in alice, scope: :user
    @alices_aspect_1 = alice.aspects.where(:name => "generic").first
    @alices_aspect_2 = alice.aspects.create(:name => "another aspect")

    allow(@controller).to receive(:current_user).and_return(alice)
    request.env["HTTP_REFERER"] = 'http://' + request.host
  end

  describe "#show" do
    it "succeeds" 

    it 'redirects on an invalid id' 

  end

  describe "#create" do
    context "with valid params" do
      it "creates an aspect" 


      it "returns the created aspect as json" 


      context "with person_id param" do
        it "creates a contact if one does not already exist" 


        it "adds a new contact to the new aspect" 


        it "adds an existing contact to the new aspect" 

      end
    end

    context "with invalid params" do
      it "does not create an aspect" 


      it "responds with 422" 

    end
  end

  describe "#update" do
    before do
      @alices_aspect_1 = alice.aspects.create(:name => "Bruisers")
    end

    it "doesn't overwrite random attributes" 


    it "should return the name and id of the updated item" 

  end

  describe "update_order" do
    it "updates the aspect order" 

  end

  describe "#destroy" do
    before do
      @alices_aspect_1 = alice.aspects.create(name: "Contacts")
    end

    context "with no auto follow back aspect" do
      it "destoys the aspect" 


      it "renders a flash message on success" 

    end

    context "with the aspect set as auto follow back" do
      before do
        alice.auto_follow_back = true
        alice.auto_follow_back_aspect = @alices_aspect_1
        alice.save
      end

      it "destoys the aspect" 


      it "disables auto follow back" 


      it "renders a flash message telling you to set a new auto follow back aspect" 

    end
  end
end

