# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe ContactsController do
  before(:each) do
    login
    set_current_tab(:contacts)
  end

  # GET /contacts
  # GET /contacts.xml
  #----------------------------------------------------------------------------
  describe "responding to GET index" do
    it "should expose all contacts as @contacts and render [index] template" 


    it "should perform lookup using query string" 


    describe "AJAX pagination" do
      it "should pick up page number from params" 


      it "should pick up saved page number from session" 


      it "should reset current_page when query is altered" 

    end

    describe "with mime type of JSON" do
      it "should render all contacts as JSON" 

    end

    describe "with mime type of XML" do
      it "should render all contacts as xml" 

    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml                                                    HTML
  #----------------------------------------------------------------------------
  describe "responding to GET show" do
    describe "with mime type of HTML" do
      before(:each) do
        @contact = create(:contact, id: 42)
        @stage = Setting.unroll(:opportunity_stage)
        @comment = Comment.new
      end

      it "should expose the requested contact as @contact" 


      it "should update an activity when viewing the contact" 

    end

    describe "with mime type of JSON" do
      it "should render the requested contact as JSON" 

    end

    describe "with mime type of XML" do
      it "should render the requested contact as xml" 

    end

    describe "contact got deleted or otherwise unavailable" do
      it "should redirect to contact index if the contact got deleted" 


      it "should redirect to contact index if the contact is protected" 


      it "should return 404 (Not Found) XML error" 

    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml                                                  AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET new" do
    it "should expose a new contact as @contact and render [new] template" 


    it "should created an instance of related object when necessary" 


    describe "(when creating related contact)" do
      it "should redirect to parent asset's index page with the message if parent asset got deleted" 


      it "should redirect to parent asset's index page with the message if parent asset got protected" 

    end
  end

  # GET /contacts/field_group                                              AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET field_group" do
    context "with an existing tag" do
      before :each do
        @tag = create(:tag)
      end

      it "should return with an existing tag name" 


      it "should have the same count of tags" 

    end

    context "without an existing tag" do
      it "should not find a tag" 


      it "should have the same count of tags" 

    end
  end

  # GET /contacts/1/edit                                                   AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET edit" do
    it "should expose the requested contact as @contact and render [edit] template" 


    it "should expose the requested contact as @contact and linked account as @account" 


    it "should expose previous contact as @previous when necessary" 


    describe "(contact got deleted or is otherwise unavailable)" do
      it "should reload current page with the flash message if the contact got deleted" 


      it "should reload current page with the flash message if the contact is protected" 

    end

    describe "(previous contact got deleted or is otherwise unavailable)" do
      before(:each) do
        @contact = create(:contact, user: current_user)
        @previous = create(:contact, user: create(:user))
      end

      it "should notify the view if previous contact got deleted" 


      it "should notify the view if previous contact got protected" 

    end
  end

  # POST /contacts
  # POST /contacts.xml                                                     AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST create" do
    describe "with valid params" do
      it "should expose a newly created contact as @contact and render [create] template" 


      it "should be able to associate newly created contact with the opportunity" 


      it "should reload contacts to update pagination if called from contacts index" 


      it "should add a new comment to the newly created contact when specified" 

    end

    describe "with invalid params" do
      before(:each) do
        @contact = build(:contact, first_name: nil, user: current_user, lead: nil)
        allow(Contact).to receive(:new).and_return(@contact)
      end

      # Redraw [create] form with selected account.
      it "should redraw [Create Contact] form with selected account" 


      # Redraw [create] form with related account.
      it "should redraw [Create Contact] form with related account" 


      it "should redraw [Create Contact] form with blank account" 


      it "should preserve Opportunity when called from Oppotuunity page" 

    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml                                                    AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT update" do
    describe "with valid params" do
      it "should update the requested contact and render [update] template" 


      it "should be able to create a new account and link it to the contact" 


      it "should be able to link existing account with the contact" 


      it "should update contact permissions when sharing with specific users" 


      describe "contact got deleted or otherwise unavailable" do
        it "should reload current page is the contact got deleted" 


        it "should reload current page with the flash message if the contact is protected" 

      end
    end

    describe "with invalid params" do
      it "should not update the contact, but still expose it as @contact and render [update] template" 


      it "should expose existing account as @account if selected" 

    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml                                                 AJAX
  #----------------------------------------------------------------------------
  describe "responding to DELETE destroy" do
    before(:each) do
      @contact = create(:contact, user: current_user)
    end

    describe "AJAX request" do
      it "should destroy the requested contact and render [destroy] template" 


      describe "when called from Contacts index page" do
        before(:each) do
          request.env["HTTP_REFERER"] = "http://localhost/contacts"
        end

        it "should try previous page and render index action if current page has no contacts" 


        it "should render index action when deleting last contact" 

      end

      describe "when called from related asset page page" do
        it "should reset current page to 1" 

      end

      describe "contact got deleted or otherwise unavailable" do
        it "should reload current page is the contact got deleted" 


        it "should reload current page with the flash message if the contact is protected" 

      end
    end

    describe "HTML request" do
      it "should redirect to Contacts index when a contact gets deleted from its landing page" 


      it "should redirect to contact index with the flash message is the contact got deleted" 


      it "should redirect to contact index with the flash message if the contact is protected" 

    end
  end

  # PUT /contacts/1/attach
  # PUT /contacts/1/attach.xml                                             AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT attach" do
    describe "tasks" do
      before do
        @model = create(:contact)
        @attachment = create(:task, asset: nil)
      end
      it_should_behave_like("attach")
    end

    describe "opportunities" do
      before do
        @model = create(:contact)
        @attachment = create(:opportunity)
      end
      it_should_behave_like("attach")
    end
  end

  # PUT /contacts/1/attach
  # PUT /contacts/1/attach.xml                                             AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT attach" do
    describe "tasks" do
      before do
        @model = create(:contact)
        @attachment = create(:task, asset: nil)
      end
      it_should_behave_like("attach")
    end

    describe "opportunities" do
      before do
        @model = create(:contact)
        @attachment = create(:opportunity)
      end
      it_should_behave_like("attach")
    end
  end

  # POST /contacts/1/discard
  # POST /contacts/1/discard.xml                                           AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST discard" do
    describe "tasks" do
      before do
        @model = create(:contact)
        @attachment = create(:task, asset: @model)
      end
      it_should_behave_like("discard")
    end

    describe "opportunities" do
      before do
        @attachment = create(:opportunity)
        @model = create(:contact)
        @model.opportunities << @attachment
      end
      it_should_behave_like("discard")
    end
  end

  # POST /contacts/auto_complete/query                                     AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST auto_complete" do
    before(:each) do
      @auto_complete_matches = [create(:contact, first_name: "Hello", last_name: "World", user: current_user)]
    end

    it_should_behave_like("auto complete")
  end

  # GET /contacts/redraw                                                   AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST redraw" do
    it "should save user selected contact preference" 


    it "should set similar options for Leads" 


    it "should reset current page to 1" 


    it "should select @contacts and render [index] template" 

  end
end

