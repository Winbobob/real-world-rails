# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe LeadsController do
  before(:each) do
    login
    set_current_tab(:leads)
  end

  # GET /leads
  # GET /leads.xml                                                AJAX and HTML
  #----------------------------------------------------------------------------
  describe "responding to GET index" do
    it "should expose all leads as @leads and render [index] template" 


    it "should collect the data for the leads sidebar" 


    it "should filter out leads by status" 


    it "should perform lookup using query string" 


    describe "AJAX pagination" do
      it "should pick up page number from params" 


      it "should pick up saved page number from session" 


      it "should reset current_page when query is altered" 

    end

    describe "with mime type of JSON" do
      it "should render all leads as JSON" 

    end

    describe "with mime type of XML" do
      it "should render all leads as xml" 

    end
  end

  # GET /leads/1
  # GET /leads/1.xml                                                       HTML
  #----------------------------------------------------------------------------
  describe "responding to GET show" do
    describe "with mime type of HTML" do
      before(:each) do
        @lead = create(:lead, id: 42, user: current_user)
        @comment = Comment.new
      end

      it "should expose the requested lead as @lead and render [show] template" 


      it "should update an activity when viewing the lead" 

    end

    describe "with mime type of JSON" do
      it "should render the requested lead as JSON" 

    end

    describe "with mime type of XML" do
      it "should render the requested lead as xml" 

    end

    describe "lead got deleted or otherwise unavailable" do
      it "should redirect to lead index if the lead got deleted" 


      it "should redirect to lead index if the lead is protected" 


      it "should return 404 (Not Found) JSON error" 


      it "should return 404 (Not Found) XML error" 

    end
  end

  # GET /leads/new
  # GET /leads/new.xml                                                     AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET new" do
    it "should expose a new lead as @lead and render [new] template" 


    it "should create related object when necessary" 


    describe "(when creating related lead)" do
      it "should redirect to parent asset's index page with the message if parent asset got deleted" 


      it "should redirect to parent asset's index page with the message if parent asset got protected" 

    end
  end

  # GET /leads/1/edit                                                      AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET edit" do
    it "should expose the requested lead as @lead and render [edit] template" 


    it "should find previous lead when necessary" 


    describe "lead got deleted or is otherwise unavailable" do
      it "should reload current page with the flash message if the lead got deleted" 


      it "should reload current page with the flash message if the lead is protected" 

    end

    describe "(previous lead got deleted or is otherwise unavailable)" do
      before(:each) do
        @lead = create(:lead, user: current_user)
        @previous = create(:lead, user: create(:user))
      end

      it "should notify the view if previous lead got deleted" 


      it "should notify the view if previous lead got protected" 

    end
  end

  # POST /leads
  # POST /leads.xml                                                        AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST create" do
    describe "with valid params" do
      it "should expose a newly created lead as @lead and render [create] template" 


      it "should copy selected campaign permissions unless asked otherwise" 


      it "should get the data to update leads sidebar if called from leads index" 


      it "should reload leads to update pagination if called from leads index" 


      it "should reload lead campaign if called from campaign landing page" 


      it "should add a new comment to the newly created lead when specified" 

    end

    describe "with invalid params" do
      it "should expose a newly created but unsaved lead as @lead and still render [create] template" 

    end
  end

  # PUT /leads/1
  # PUT /leads/1.xml
  #----------------------------------------------------------------------------
  describe "responding to PUT update" do
    describe "with valid params" do
      it "should update the requested lead, expose it as @lead, and render [update] template" 


      it "should update lead status" 


      it "should update lead source" 


      it "should update lead campaign" 


      it "should decrement campaign leads count if campaign has been removed" 


      it "should increment campaign leads count if campaign has been assigned" 


      it "should update both campaign leads counts if reassigned to a new campaign" 


      it "should update shared permissions for the lead" 


      it "should get the data for leads sidebar when called from leads index" 


      it "should reload lead campaign if called from campaign landing page" 


      describe "lead got deleted or otherwise unavailable" do
        it "should reload current page with the flash message if the lead got deleted" 


        it "should reload current page with the flash message if the lead is protected" 

      end
    end

    describe "with invalid params" do
      it "should not update the lead, but still expose it as @lead and render [update] template" 

    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.xml                                           AJAX and HTML
  #----------------------------------------------------------------------------
  describe "responding to DELETE destroy" do
    before(:each) do
      @lead = create(:lead, user: current_user)
    end

    describe "AJAX request" do
      it "should destroy the requested lead and render [destroy] template" 


      describe "when called from Leads index page" do
        before(:each) do
          request.env["HTTP_REFERER"] = "http://localhost/leads"
        end

        it "should get data for the sidebar" 


        it "should try previous page and render index action if current page has no leads" 


        it "should render index action when deleting last lead" 

      end

      describe "when called from campaign landing page" do
        before(:each) do
          @campaign = create(:campaign)
          @lead = create(:lead, user: current_user, campaign: @campaign)
          request.env["HTTP_REFERER"] = "http://localhost/campaigns/#{@campaign.id}"
        end

        it "should reset current page to 1" 


        it "should reload campaiign to be able to refresh its summary" 

      end

      describe "lead got deleted or otherwise unavailable" do
        it "should reload current page with the flash message if the lead got deleted" 


        it "should reload current page with the flash message if the lead is protected" 

      end
    end

    describe "HTML request" do
      it "should redirect to Leads index when a lead gets deleted from its landing page" 


      it "should redirect to lead index with the flash message is the lead got deleted" 


      it "should redirect to lead index with the flash message if the lead is protected" 

    end
  end

  # GET /leads/1/convert
  # GET /leads/1/convert.xml                                               AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET convert" do
    it "should should collect necessary data and render [convert] template" 


    describe "(lead got deleted or is otherwise unavailable)" do
      it "should reload current page with the flash message if the lead got deleted" 


      it "should reload current page with the flash message if the lead is protected" 

    end

    describe "(previous lead got deleted or is otherwise unavailable)" do
      before(:each) do
        @lead = create(:lead, user: current_user)
        @previous = create(:lead, user: create(:user))
      end

      it "should notify the view if previous lead got deleted" 


      it "should notify the view if previous lead got protected" 

    end
  end

  # PUT /leads/1/promote
  # PUT /leads/1/promote.xml                                               AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT promote" do
    it "on success: should change lead's status to [converted] and render [promote] template" 


    it "should copy lead permissions to newly created account and opportunity when asked so" 


    it "should assign lead's campaign to the newly created opportunity" 


    it "should assign lead's source to the newly created opportunity" 


    it "should get the data for leads sidebar when called from leads index" 


    it "should reload lead campaign if called from campaign landing page" 


    it "on failure: should not change lead's status and still render [promote] template" 


    describe "lead got deleted or otherwise unavailable" do
      it "should reload current page with the flash message if the lead got deleted" 


      it "should reload current page with the flash message if the lead is protected" 

    end
  end

  # PUT /leads/1/reject
  # PUT /leads/1/reject.xml                                       AJAX and HTML
  #----------------------------------------------------------------------------
  describe "responding to PUT reject" do
    before(:each) do
      @lead = create(:lead, user: current_user, status: "new")
    end

    describe "AJAX request" do
      it "should reject the requested lead and render [reject] template" 


      it "should get the data for leads sidebar when called from leads index" 


      it "should reload lead campaign if called from campaign landing page" 


      describe "lead got deleted or otherwise unavailable" do
        it "should reload current page with the flash message if the lead got deleted" 


        it "should reload current page with the flash message if the lead is protected" 

      end
    end

    describe "HTML request" do
      it "should redirect to Leads index when a lead gets rejected from its landing page" 


      describe "lead got deleted or otherwise unavailable" do
        it "should redirect to lead index if the lead got deleted" 


        it "should redirect to lead index if the lead is protected" 

      end
    end
  end

  # PUT /leads/1/attach
  # PUT /leads/1/attach.xml                                                AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT attach" do
    describe "tasks" do
      before do
        @model = create(:lead)
        @attachment = create(:task, asset: nil)
      end
      it_should_behave_like("attach")
    end
  end

  # PUT /leads/1/attach
  # PUT /leads/1/attach.xml                                                AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT attach" do
    describe "tasks" do
      before do
        @model = create(:lead)
        @attachment = create(:task, asset: nil)
      end
      it_should_behave_like("attach")
    end
  end

  # POST /leads/1/discard
  # POST /leads/1/discard.xml                                              AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST discard" do
    before(:each) do
      @attachment = create(:task, assigned_to: current_user)
      @model = create(:lead)
      @model.tasks << @attachment
    end

    it_should_behave_like("discard")
  end

  # POST /leads/auto_complete/query                                        AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST auto_complete" do
    before(:each) do
      @auto_complete_matches = [create(:lead, first_name: "Hello", last_name: "World", user: current_user)]
    end

    it_should_behave_like("auto complete")
  end

  # GET /leads/redraw                                                      AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET redraw" do
    it "should save user selected lead preference" 


    it "should set similar options for Contacts" 


    it "should reset current page to 1" 


    it "should select @leads and render [index] template" 

  end

  # POST /leads/filter                                                     AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST filter" do
    it "should filter out leads as @leads and render :index action" 


    it "should reset current page to 1" 

  end
end

