# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ReportsController do

  describe 'POST #create' do
    let(:info_request){ FactoryBot.create(:info_request) }
    let(:user){ FactoryBot.create(:user) }

    context "when reporting a request when not logged in" do
      it "should only allow logged-in users to report requests" 

    end

    context "when reporting a request (logged in)" do
      before do
        session[:user_id] = user.id
      end

      it "finds the expected request" 


      it "sets reportable to the request" 


      it "sets report_reasons to the request report reasons" 


      it 'ignores an empty comment_id param' 


      it "should 404 for non-existent requests" 


      it 'should 404 for embargoed requests' 


      it "should mark a request as having been reported" 


      it "sets the flash message when the request gets successfully reported" 


      it "should not allow a request to be reported twice" 


      it "should send an email from the reporter to admins" 


      it "should force the user to pick a reason" 


    end

   context "when reporting a comment (logged in)" do
      before do
        session[:user_id] = user.id
      end

      let(:comment) do
        FactoryBot.create(:comment, :info_request => info_request,
                                    :attention_requested => false)
      end

      it "finds the expected request" 


      it "finds the expected comment" 


      it "sets reportable to the comment" 


      it "sets report_reasons to the comment report reasons" 


      it "returns a 404 if the comment does not belong to the request" 


      it "marks the comment as having been reported" 
       it "does not mark the parent request as having been reported" 


       it "sends an email alerting admins to the report" 


       it "informs the user the comment has been reported" 


       it "redirects to the parent info_request page" 


    end

  end

  describe "GET #new" do
    let(:info_request){ FactoryBot.create(:info_request) }
    let(:user){ FactoryBot.create(:user) }

    context "not logged in" do
      it "should require the user to be logged in" 

    end

    context "when reporting a request (logged in)" do
      before :each do
        session[:user_id] = user.id
      end

      it "finds the expected request" 


      it "sets reportable to the request" 


      it "sets report_reasons to the request report reasons" 


      it "sets the page title" 


      it "should show the form" 


      it "should 404 for non-existent requests" 


      it 'should 404 for embargoed requests' 


    end

    context "when reporting a comment (logged in)" do
      render_views

      before :each do
        session[:user_id] = user.id
      end

      let(:comment) do
        FactoryBot.create(:comment, :info_request => info_request,
                                    :attention_requested => false)
      end

      it "finds the expected request" 


      it "finds the expected comment" 


      it "sets reportable to the comment" 


      it "sets report_reasons to the comment report reasons" 


      it "sets the page title" 


      it "returns a 404 if the comment does not belong to the request" 


      it "should show the form" 


      it "copies the comment id into a hidden form field" 


      it "should 404 for non-existent requests" 


      it 'should 404 for embargoed requests' 


    end

  end

end

