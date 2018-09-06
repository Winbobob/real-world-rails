# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AccountsController do
  def get_data_for_sidebar
    @category = Setting.account_category.dup
  end

  before do
    login
    set_current_tab(:accounts)
  end

  # GET /accounts
  # GET /accounts.xml
  #----------------------------------------------------------------------------
  describe "responding to GET index" do
    before(:each) do
      get_data_for_sidebar
    end

    it "should expose all accounts as @accounts and render [index] template" 


    it "should collect the data for the accounts sidebar" 


    it "should filter out accounts by category" 


    it "should perform lookup using query string" 


    describe "AJAX pagination" do
      it "should pick up page number from params" 


      it "should pick up saved page number from session" 


      it "should reset current_page when query is altered" 

    end

    describe "with mime type of JSON" do
      it "should render all accounts as json" 

    end

    describe "with mime type of XML" do
      it "should render all accounts as xml" 

    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml                                                    HTML
  #----------------------------------------------------------------------------
  describe "responding to GET show" do
    describe "with mime type of HTML" do
      before do
        @account = create(:account, user: current_user)
        @stage = Setting.unroll(:opportunity_stage)
        @comment = Comment.new
      end

      it "should expose the requested account as @account and render [show] template" 


      it "should update an activity when viewing the account" 

    end

    describe "with mime type of JSON" do
      it "should render the requested account as json" 

    end

    describe "with mime type of XML" do
      it "should render the requested account as xml" 

    end

    describe "account got deleted or otherwise unavailable" do
      it "should redirect to account index if the account got deleted" 


      it "should redirect to account index if the account is protected" 


      it "should return 404 (Not Found) JSON error" 


      it "should return 404 (Not Found) XML error" 

    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml                                                  AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET new" do
    it "should expose a new account as @account and render [new] template" 


    it "should created an instance of related object when necessary" 

  end

  # GET /accounts/1/edit                                                   AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET edit" do
    it "should expose the requested account as @account and render [edit] template" 


    it "should expose previous account as @previous when necessary" 


    describe "(account got deleted or is otherwise unavailable)" do
      it "should reload current page with the flash message if the account got deleted" 


      it "should reload current page with the flash message if the account is protected" 

    end

    describe "(previous account got deleted or is otherwise unavailable)" do
      before do
        @account = create(:account, user: current_user)
        @previous = create(:account, user: create(:user))
      end

      it "should notify the view if previous account got deleted" 


      it "should notify the view if previous account got protected" 

    end
  end

  # POST /accounts
  # POST /accounts.xml                                                     AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST create" do
    describe "with valid params" do
      it "should expose a newly created account as @account and render [create] template" 


      # Note: [Create Account] is shown only on Accounts index page.
      it "should reload accounts to update pagination" 


      it "should get data to update account sidebar" 


      it "should add a new comment to the newly created account when specified" 

    end

    describe "with invalid params" do
      it "should expose a newly created but unsaved account as @account and still render [create] template" 

    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml                                                    AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT update" do
    describe "with valid params" do
      it "should update the requested account, expose the requested account as @account, and render [update] template" 


      it "should get data for accounts sidebar when called from Campaigns index" 


      it "should update account permissions when sharing with specific users" 


      describe "account got deleted or otherwise unavailable" do
        it "should reload current page is the account got deleted" 


        it "should reload current page with the flash message if the account is protected" 

      end
    end

    describe "with invalid params" do
      it "should not update the requested account but still expose the requested account as @account, and render [update] template" 

    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  #----------------------------------------------------------------------------
  describe "responding to DELETE destroy" do
    before do
      @account = create(:account, user: current_user)
    end

    describe "AJAX request" do
      it "should destroy the requested account and render [destroy] template" 


      it "should get data for accounts sidebar" 


      it "should try previous page and render index action if current page has no accounts" 


      it "should render index action when deleting last account" 


      describe "account got deleted or otherwise unavailable" do
        it "should reload current page is the account got deleted" 


        it "should reload current page with the flash message if the account is protected" 

      end
    end

    describe "HTML request" do
      it "should redirect to Accounts index when an account gets deleted from its landing page" 


      it "should redirect to account index with the flash message is the account got deleted" 


      it "should redirect to account index with the flash message if the account is protected" 

    end
  end

  # PUT /accounts/1/attach
  # PUT /accounts/1/attach.xml                                             AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT attach" do
    describe "tasks" do
      before do
        @model = create(:account)
        @attachment = create(:task, asset: nil)
      end
      it_should_behave_like("attach")
    end

    describe "contacts" do
      before do
        @model = create(:account)
        @attachment = create(:contact, account: nil)
      end
      it_should_behave_like("attach")
    end
  end

  # POST /accounts/1/discard
  # POST /accounts/1/discard.xml                                           AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST discard" do
    describe "tasks" do
      before do
        @model = create(:account)
        @attachment = create(:task, asset: @model)
      end
      it_should_behave_like("discard")
    end

    describe "contacts" do
      before do
        @attachment = create(:contact)
        @model = create(:account)
        @model.contacts << @attachment
      end
      it_should_behave_like("discard")
    end

    describe "opportunities" do
      before do
        @attachment = create(:opportunity)
        @model = create(:account)
        @model.opportunities << @attachment
      end
      # 'super from singleton method that is defined to multiple classes is not supported;'
      # TODO: Uncomment this when it is fixed in 1.9.3
      # it_should_behave_like("discard")
    end
  end

  # POST /accounts/auto_complete/query                                     AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST auto_complete" do
    before do
      @auto_complete_matches = [create(:account, name: "Hello World", user: current_user)]
    end

    it_should_behave_like("auto complete")
  end

  # GET  /accounts/redraw                                                 AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET redraw" do
    it "should save user selected account preference" 


    it "should reset current page to 1" 


    it "should select @accounts and render [index] template" 

  end

  # POST /accounts/filter                                                  AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST filter" do
    it "should expose filtered accounts as @accounts and render [index] template" 


    it "should reset current page to 1" 

  end
end

