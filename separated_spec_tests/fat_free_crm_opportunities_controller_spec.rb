# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe OpportunitiesController do
  def get_data_for_sidebar
    @stage = Setting.unroll(:opportunity_stage)
  end

  before do
    login
    set_current_tab(:opportunities)
  end

  # GET /opportunities
  # GET /opportunities.xml
  #----------------------------------------------------------------------------
  describe "responding to GET index" do
    before do
      get_data_for_sidebar
    end

    it "should expose all opportunities as @opportunities and render [index] template" 


    it "should expose the data for the opportunities sidebar" 


    it "should filter out opportunities by stage" 


    it "should perform lookup using query string" 


    describe "AJAX pagination" do
      it "should pick up page number from params" 


      it "should pick up saved page number from session" 


      it "should reset current_page when query is altered" 

    end

    describe "with mime type of JSON" do
      it "should render all opportunities as JSON" 

    end

    describe "with mime type of JSON" do
      it "should render all opportunities as JSON" 

    end

    describe "with mime type of XML" do
      it "should render all opportunities as xml" 

    end
  end

  # GET /opportunities/1
  # GET /opportunities/1.xml                                               HTML
  #----------------------------------------------------------------------------
  describe "responding to GET show" do
    describe "with mime type of HTML" do
      before do
        @opportunity = create(:opportunity, id: 42)
        @stage = Setting.unroll(:opportunity_stage)
        @comment = Comment.new
      end

      it "should expose the requested opportunity as @opportunity and render [show] template" 


      it "should update an activity when viewing the opportunity" 

    end

    describe "with mime type of JSON" do
      it "should render the requested opportunity as JSON" 

    end

    describe "with mime type of XML" do
      it "should render the requested opportunity as xml" 

    end

    describe "opportunity got deleted or otherwise unavailable" do
      it "should redirect to opportunity index if the opportunity got deleted" 


      it "should redirect to opportunity index if the opportunity is protected" 


      it "should return 404 (Not Found) JSON error" 


      it "should return 404 (Not Found) XML error" 

    end
  end

  # GET /opportunities/new
  # GET /opportunities/new.xml                                             AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET new" do
    it "should expose a new opportunity as @opportunity and render [new] template" 


    it "should created an instance of related object when necessary" 


    describe "(when creating related opportunity)" do
      it "should redirect to parent asset's index page with the message if parent asset got deleted" 


      it "should redirect to parent asset's index page with the message if parent asset got protected" 

    end
  end

  # GET /opportunities/1/edit                                              AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET edit" do
    it "should expose the requested opportunity as @opportunity and render [edit] template" 


    it "should expose previous opportunity as @previous when necessary" 


    describe "opportunity got deleted or is otherwise unavailable" do
      it "should reload current page with the flash message if the opportunity got deleted" 


      it "should reload current page with the flash message if the opportunity is protected" 

    end

    describe "(previous opportunity got deleted or is otherwise unavailable)" do
      before do
        @opportunity = create(:opportunity, user: current_user)
        @previous = create(:opportunity, user: create(:user))
      end

      it "should notify the view if previous opportunity got deleted" 


      it "should notify the view if previous opportunity got protected" 

    end
  end

  # POST /opportunities
  # POST /opportunities.xml                                                AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST create" do
    describe "with valid params" do
      before do
        @opportunity = build(:opportunity, user: current_user)
        allow(Opportunity).to receive(:new).and_return(@opportunity)
        @stage = Setting.unroll(:opportunity_stage)
      end

      it "should expose a newly created opportunity as @opportunity and render [create] template" 


      it "should get sidebar data if called from opportunities index" 


      it "should find related account if called from account landing page" 


      it "should find related campaign if called from campaign landing page" 


      it "should reload opportunities to update pagination if called from opportunities index" 


      it "should associate opportunity with the campaign when called from campaign landing page" 


      it "should associate opportunity with the contact when called from contact landing page" 


      it "should create new account and associate it with the opportunity" 


      it "should associate opportunity with the existing account" 


      it "should update related campaign revenue if won" 


      it "should add a new comment to the newly created opportunity when specified" 

    end

    describe "with invalid params" do
      it "should expose a newly created but unsaved opportunity as @opportunity with blank @account and render [create] template" 


      it "should expose a newly created but unsaved opportunity as @opportunity with existing @account and render [create] template" 


      it "should preserve the campaign when called from campaign landing page" 


      it "should preserve the contact when called from contact landing page" 

    end
  end

  # PUT /opportunities/1
  # PUT /opportunities/1.xml                                               AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT update" do
    describe "with valid params" do
      it "should update the requested opportunity, expose it as @opportunity, and render [update] template" 


      it "should get sidebar data if called from opportunities index" 


      it "should find related account if called from account landing page" 


      it "should remove related account if blank :account param is given" 


      it "should find related campaign if called from campaign landing page" 


      it "should be able to create an account and associate it with updated opportunity" 


      it "should be able to create an account and associate it with updated opportunity" 


      it "should update opportunity permissions when sharing with specific users" 


      it "should reload opportunity campaign if called from campaign landing page" 


      describe "updating campaign revenue (same campaign)" do
        it "should add to actual revenue when opportunity is closed/won" 


        it "should substract from actual revenue when opportunity is no longer closed/won" 


        it "should not update actual revenue when opportunity is not closed/won" 

      end

      describe "updating campaign revenue (diferent campaigns)" do
        it "should update newly assigned campaign when opportunity is closed/won" 


        it "should update old campaign when opportunity is no longer closed/won" 


        it "should not update campaigns when opportunity is not closed/won" 

      end

      describe "opportunity got deleted or otherwise unavailable" do
        it "should reload current page with the flash message if the opportunity got deleted" 


        it "should reload current page with the flash message if the opportunity is protected" 

      end
    end

    describe "with invalid params" do
      it "should not update the requested opportunity but still expose it as @opportunity, and render [update] template" 


      it "should expose existing account as @account if selected" 

    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.xml                                            AJAX
  #----------------------------------------------------------------------------
  describe "responding to DELETE destroy" do
    before do
      @opportunity = create(:opportunity, user: current_user)
    end

    describe "AJAX request" do
      it "should destroy the requested opportunity and render [destroy] template" 


      describe "when called from Opportunities index page" do
        before do
          request.env["HTTP_REFERER"] = "http://localhost/opportunities"
        end

        it "should get sidebar data if called from opportunities index" 


        it "should try previous page and render index action if current page has no opportunities" 


        it "should render index action when deleting last opportunity" 

      end

      describe "when called from related asset page" do
        it "should reset current page to 1" 


        it "should reload campaiign to be able to refresh its summary" 


        it "should reload campaiign to be able to refresh its summary" 

      end

      describe "opportunity got deleted or otherwise unavailable" do
        it "should reload current page is the opportunity got deleted" 


        it "should reload current page with the flash message if the opportunity is protected" 

      end
    end

    describe "HTML request" do
      it "should redirect to Opportunities index when an opportunity gets deleted from its landing page" 


      it "should redirect to opportunity index with the flash message is the opportunity got deleted" 


      it "should redirect to opportunity index with the flash message if the opportunity is protected" 

    end
  end

  # PUT /opportunities/1/attach
  # PUT /opportunities/1/attach.xml                                        AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT attach" do
    describe "tasks" do
      before do
        @model = create(:opportunity)
        @attachment = create(:task, asset: nil)
      end
      it_should_behave_like("attach")
    end

    describe "contacts" do
      before do
        @model = create(:opportunity)
        @attachment = create(:contact)
      end
      it_should_behave_like("attach")
    end
  end

  # POST /opportunities/1/discard
  # POST /opportunities/1/discard.xml                                      AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST discard" do
    describe "tasks" do
      before do
        @model = create(:opportunity)
        @attachment = create(:task, asset: @model)
      end
      it_should_behave_like("discard")
    end

    describe "contacts" do
      before do
        @attachment = create(:contact)
        @model = create(:opportunity)
        @model.contacts << @attachment
      end
      it_should_behave_like("discard")
    end
  end

  # POST /opportunities/auto_complete/query                                AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST auto_complete" do
    before do
      @auto_complete_matches = [create(:opportunity, name: "Hello World", user: current_user)]
    end

    it_should_behave_like("auto complete")
  end

  # GET /opportunities/redraw                                              AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET redraw" do
    it "should save user selected opportunity preference" 


    it "should reset current page to 1" 


    it "should select @opportunities and render [index] template" 

  end

  # POST /opportunities/filter                                             AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET filter" do
    it "should expose filtered opportunities as @opportunity and render [filter] template" 


    it "should reset current page to 1" 

  end
end

