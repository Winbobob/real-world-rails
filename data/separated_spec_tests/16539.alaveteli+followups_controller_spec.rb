# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FollowupsController do
  render_views

  let(:request_user) { FactoryBot.create(:user) }
  let(:request) { FactoryBot.create(:info_request_with_incoming, :user => request_user) }
  let(:message_id) { request.incoming_messages[0].id }
  let(:pro_user) { FactoryBot.create(:pro_user) }

  describe "GET #new" do

    context "when not logged in" do
      it 'raises an ActiveRecord::RecordNotFound error for an embargoed request' 

    end

    context "when a pro user is logged in" do
      before do
        session[:user_id] = pro_user.id
      end

      it 'finds their own embargoed requests' 


      it 'raises an ActiveRecord::RecordNotFound error for other embargoed requests' 

    end

    it "displays 'wrong user' message when not logged in as the request owner" 


    it "does not allow follow ups to external requests" 


    it "redirects to the signin page if not logged in" 


    it "calls the message a followup if there is an incoming message" 


    it "calls the message a reply if there is no incoming message" 


    context "logged in as the request owner" do

      before(:each) do
        session[:user_id] = request_user.id
      end

      it "shows the followup form" 


      it "shows the followup form when replying to an incoming message" 


      it "offers the opportunity to reply to the main address" 


      it "offers an opportunity to reply to another address" 


      context "the request is hidden" do

        let(:hidden_request) do
          FactoryBot.create(:info_request_with_incoming, :user => request_user,
                                                         :prominence => "hidden")
        end

        it "does not show the form, even to the request owner" 


        it 'responds to a json request with a 403' 


      end

    end

    context 'when viewing a response for an external request' do

      it "does not allow follow ups to external requests" 


      it 'the response code should be successful' 


    end

    context 'when viewing a response for an embargoed request' do
      let(:pro_user) { FactoryBot.create(:pro_user) }
      let(:embargoed_request) do
        FactoryBot.create(:embargoed_request, user: pro_user)
      end

      it "sets @in_pro_area" 

    end

  end

  describe "POST #preview" do

    let(:dummy_message) do
      { :body => "What a useless response! You suck.",
        :what_doing => 'normal_sort' }
    end

    context "when not logged in" do
      it 'raises an ActiveRecord::RecordNotFound error for an embargoed request' 


      it "redirects to the signin page" 

    end

    context "when a pro user is logged in" do
      before do
        session[:user_id] = pro_user.id
      end

      it 'finds their own embargoed requests' 


      it 'raises an ActiveRecord::RecordNotFound error for other embargoed requests' 

    end

    it "displays a wrong user message when not logged in as the request owner" 


    context "logged in as the request owner" do

      before(:each) do
        session[:user_id] = request_user.id
      end

      it "displays the edit form with an error when the message body is blank" 


      it "shows a preview when input is good" 


      it "allows re-editing of a preview" 


    end

    context 'when viewing a response for an embargoed request' do
      let(:pro_user) { FactoryBot.create(:pro_user) }
      let(:embargoed_request) do
        FactoryBot.create(:embargoed_request, user: pro_user)
      end

      it "sets @in_pro_area" 

    end

  end

  describe "POST #create" do

    let(:dummy_message) do
      { :body => "What a useless response! You suck.",
        :what_doing => 'normal_sort' }
    end

    before(:each) do
      session[:user_id] = request_user.id
    end

    context "when not logged in" do
      before do
        session[:user_id] = nil
      end

      it 'raises an ActiveRecord::RecordNotFound error for an embargoed request' 


      it "redirects to the signin page" 

    end

    context "when a pro user is logged in" do
      before do
        session[:user_id] = pro_user.id
      end

      it 'finds their own embargoed requests' 


      it 'raises an ActiveRecord::RecordNotFound error for other embargoed requests' 

    end

    it "only allows the request owner to make a followup" 


    it "gives an error and renders 'show_response' when a body isn't given" 


    it "sends the follow up message" 


    it "updates the status for successful followup sends" 


    it "updates the event status for successful followup sends if the request is waiting clarification" 


    it "redirects to the request page" 


    it "displays the a confirmation once the message has been sent" 


    it "displays an error if the request has been closed to new responses" 


    context "the same followup is submitted twice" do

      before(:each) do
        post :create, :outgoing_message => dummy_message,
                      :request_id => request.id,
                      :incoming_message_id => message_id

        post :create, :outgoing_message => dummy_message,
                      :request_id => request.id,
                      :incoming_message_id => message_id
      end

      it "displays the form with an error message" 


      it "only delivers the message once" 


      it "does not repeat the message sent text" 


    end

  end

end

