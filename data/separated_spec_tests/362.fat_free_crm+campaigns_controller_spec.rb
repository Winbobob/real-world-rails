# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe CampaignsController do
  def get_data_for_sidebar
    @status = Setting.campaign_status.dup
  end

  before(:each) do
    login
    set_current_tab(:campaigns)
  end

  # GET /campaigns
  # GET /campaigns.xml
  #----------------------------------------------------------------------------
  describe "responding to GET index" do
    before(:each) do
      get_data_for_sidebar
    end

    it "should expose all campaigns as @campaigns and render [index] template" 


    it "should collect the data for the opportunities sidebar" 


    it "should filter out campaigns by status" 


    it "should perform lookup using query string" 


    describe "AJAX pagination" do
      it "should pick up page number from params" 


      it "should pick up saved page number from session" 


      it "should reset current_page when query is altered" 

    end

    describe "with mime type of JSON" do
      it "should render all campaigns as JSON" 

    end

    describe "with mime type of XML" do
      it "should render all campaigns as xml" 

    end
  end

  # GET /campaigns/1
  # GET /campaigns/1.xml                                                   HTML
  #----------------------------------------------------------------------------
  describe "responding to GET show" do
    describe "with mime type of HTML" do
      before(:each) do
        @campaign = create(:campaign, id: 42, user: current_user)
        @stage = Setting.unroll(:opportunity_stage)
        @comment = Comment.new
      end

      it "should expose the requested campaign as @campaign and render [show] template" 


      it "should update an activity when viewing the campaign" 

    end

    describe "with mime type of JSON" do
      it "should render the requested campaign as JSON" 

    end

    describe "with mime type of XML" do
      it "should render the requested campaign as XML" 

    end

    describe "campaign got deleted or otherwise unavailable" do
      it "should redirect to campaign index if the campaign got deleted" 


      it "should redirect to campaign index if the campaign is protected" 


      it "should return 404 (Not Found) JSON error" 


      it "should return 404 (Not Found) XML error" 

    end
  end

  # GET /campaigns/new
  # GET /campaigns/new.xml                                                 AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET new" do
    it "should expose a new campaign as @campaign" 


    it "should create related object when necessary" 

  end

  # GET /campaigns/1/edit                                                  AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET edit" do
    it "should expose the requested campaign as @campaign and render [edit] template" 


    it "should find previous campaign as necessary" 


    describe "(campaign got deleted or is otherwise unavailable)" do
      it "should reload current page with the flash message if the campaign got deleted" 


      it "should reload current page with the flash message if the campaign is protected" 

    end

    describe "(previous campaign got deleted or is otherwise unavailable)" do
      before(:each) do
        @campaign = create(:campaign, user: current_user)
        @previous = create(:campaign, user: create(:user))
      end

      it "should notify the view if previous campaign got deleted" 


      it "should notify the view if previous campaign got protected" 

    end
  end

  # POST /campaigns
  # POST /campaigns.xml                                                    AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST create" do
    describe "with valid params" do
      it "should expose a newly created campaign as @campaign and render [create] template" 


      it "should get data to update campaign sidebar" 


      it "should reload campaigns to update pagination" 


      it "should add a new comment to the newly created campaign when specified" 

    end

    describe "with invalid params" do
      it "should expose a newly created but unsaved campaign as @campaign and still render [create] template" 

    end
  end

  # PUT /campaigns/1
  # PUT /campaigns/1.xml                                                   AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT update" do
    describe "with valid params" do
      it "should update the requested campaign and render [update] template" 


      it "should get data for campaigns sidebar when called from Campaigns index" 


      it "should update campaign permissions when sharing with specific users" 


      describe "campaign got deleted or otherwise unavailable" do
        it "should reload current page with the flash message if the campaign got deleted" 


        it "should reload current page with the flash message if the campaign is protected" 

      end
    end

    describe "with invalid params" do
      it "should not update the requested campaign, but still expose it as @campaign and still render [update] template" 

    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.xml                                                AJAX
  #----------------------------------------------------------------------------
  describe "responding to DELETE destroy" do
    before(:each) do
      @campaign = create(:campaign, user: current_user)
    end

    describe "AJAX request" do
      it "should destroy the requested campaign and render [destroy] template" 


      it "should get data for campaigns sidebar" 


      it "should try previous page and render index action if current page has no campaigns" 


      it "should render index action when deleting last campaign" 


      describe "campaign got deleted or otherwise unavailable" do
        it "should reload current page with the flash message if the campaign got deleted" 


        it "should reload current page with the flash message if the campaign is protected" 

      end
    end

    describe "HTML request" do
      it "should redirect to Campaigns index when a campaign gets deleted from its landing page" 


      it "should redirect to campaign index with the flash message is the campaign got deleted" 


      it "should redirect to campaign index with the flash message if the campaign is protected" 

    end
  end

  # PUT /campaigns/1/attach
  # PUT /campaigns/1/attach.xml                                            AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT attach" do
    describe "tasks" do
      before do
        @model = create(:campaign)
        @attachment = create(:task, asset: nil)
      end
      it_should_behave_like("attach")
    end

    describe "leads" do
      before do
        @model = create(:campaign)
        @attachment = create(:lead, campaign: nil)
      end
      it_should_behave_like("attach")
    end

    describe "opportunities" do
      before do
        @model = create(:campaign)
        @attachment = create(:opportunity, campaign: nil)
      end
      it_should_behave_like("attach")
    end
  end

  # PUT /campaigns/1/attach
  # PUT /campaigns/1/attach.xml                                            AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT attach" do
    describe "tasks" do
      before do
        @model = create(:campaign)
        @attachment = create(:task, asset: nil)
      end
      it_should_behave_like("attach")
    end

    describe "leads" do
      before do
        @model = create(:campaign)
        @attachment = create(:lead, campaign: nil)
      end
      it_should_behave_like("attach")
    end

    describe "opportunities" do
      before do
        @model = create(:campaign)
        @attachment = create(:opportunity, campaign: nil)
      end
      it_should_behave_like("attach")
    end
  end

  # POST /campaigns/1/discard
  # POST /campaigns/1/discard.xml                                          AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST discard" do
    describe "tasks" do
      before do
        @model = create(:campaign)
        @attachment = create(:task, asset: @model)
      end
      it_should_behave_like("discard")
    end

    describe "leads" do
      before do
        @attachment = create(:lead)
        @model = create(:campaign)
        @model.leads << @attachment
      end
      it_should_behave_like("discard")
    end

    describe "opportunities" do
      before do
        @attachment = create(:opportunity)
        @model = create(:campaign)
        @model.opportunities << @attachment
      end
      it_should_behave_like("discard")
    end
  end

  # POST /campaigns/auto_complete/query                                    AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST auto_complete" do
    before(:each) do
      @auto_complete_matches = [create(:campaign, name: "Hello World", user: current_user)]
    end

    it_should_behave_like("auto complete")
  end

  # GET  /campaigns/redraw                                                 AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET redraw" do
    it "should save user selected campaign preference" 


    it "should reset current page to 1" 


    it "should select @campaigns and render [index] template" 

  end

  # POST /campaigns/filter                                                 AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST filter" do
    it "should expose filtered campaigns as @campaigns and render [index] template" 


    it "should reset current page to 1" 

  end
end

