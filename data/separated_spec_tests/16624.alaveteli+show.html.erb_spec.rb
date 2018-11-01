# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "request/show" do

  let(:mock_body) { FactoryBot.create(:public_body, :name => "test body") }

  let(:mock_user) do
    FactoryBot.create(:user, :name => "test user",
                             :url_name => "test_user",
                             :profile_photo => nil)
  end

  let(:admin_user) { FactoryBot.create(:admin_user) }

  let(:mock_request) do
    FactoryBot.create(:info_request, :title => "Test request",
                                     :public_body => mock_body,
                                     :user => mock_user)
  end

  let(:mock_track) do
    mock_model(TrackThing, :track_type => 'request_updates',
                           :info_request => mock_request)
  end

  def request_page
    assign :info_request, mock_request
    assign :info_request_events, []
    assign :status, mock_request.calculate_status
    assign :track_thing, mock_track
    render
  end

  it "should show the request" 


  describe "when told to show the top describe state form" do
    before do
      assign :show_top_describe_state_form, true
    end

    it "should show the first form for describing the state of the request" 

  end

  describe "when told to show the bottom describe state form" do
    before do
      assign :show_bottom_describe_state_form, true
    end

    it "should show the second form for describing the state of the request" 

  end

  describe "when the user is the request owner" do
    before do
      assign :is_owning_user, true
    end

    context "and the request status is 'waiting clarification'" do
      before do
        allow(mock_request).to receive(:calculate_status).and_return("waiting_clarification")
      end

      context "and there is a last response" do
        let(:mock_response) { FactoryBot.create(:incoming_message) }

        it "should show a link to follow up the last response with clarification" 

      end

      context "and there is no last response" do
        before do
          allow(mock_request).to receive(:get_last_public_response).and_return(nil)
        end

        it "should show a link to follow up the request without reference to a specific response" 

      end
    end
  end

  describe "when the request is being viewed by an admin" do
    before :each do
      assign :user, admin_user
      # Admins own every request
      assign :is_owning_user, true

    end

    context "and the request is waiting for a response and very overdue" do
      before do
        allow(mock_request).
          to receive(:calculate_status).and_return("waiting_response_very_overdue")
        request_page
      end

      it "should give a link to requesting an internal review" 

    end

    context "and the request is waiting clarification" do
      before do
        allow(mock_request).
          to receive(:calculate_status).and_return("waiting_clarification")
        request_page
      end

      it "should give a link to make a followup" 

    end
  end

  describe "when showing an external request" do
    before :each do
      allow(mock_request).to receive(:is_external?).and_return("true")
      allow(mock_request).
        to receive(:awaiting_description?).and_return("true")
    end

    context 'when viewing anonymously' do
      it 'should not display actions the request owner can take' 

    end

    context 'when the request is being viewed by an admin' do
      before :each do
        assign :user, admin_user
      end

      context 'and the request is waiting for a response and very overdue' do
        before do
          allow(mock_request).
            to receive(:calculate_status).
              and_return('waiting_response_very_overdue')
          request_page
        end

        it 'should not give a link to requesting an internal review' 

      end

      context 'and the request is waiting clarification' do
        before do
          allow(mock_request).
            to receive(:calculate_status).and_return('waiting_clarification')
          request_page
        end

        it 'should not give a link to make a followup' 


        it 'should not give a link to sign in (in the request status <p>)' 

      end
    end
  end

  describe 'when the authority is not subject to FOI law' do
    before do
      mock_body.add_tag_if_not_already_present('foi_no')
    end

    it 'displays a message that that authority is not obliged to respond' 


    context 'when the authority is only accepting EIR requests' do

      before do
        mock_body.add_tag_if_not_already_present('eir_only')
      end

      it 'displays a message that that authority is not obliged to respond' 


    end

  end

  describe "censoring attachment names" do
    let(:request_with_attachment) do
      FactoryBot.create(:info_request_with_html_attachment)
    end

    before do
      allow(view).to receive(:current_user).and_return(nil)
      allow(controller).to receive(:current_user).and_return(nil)
    end

    context "when there isn't a censor rule" do
      it "should show the attachment name" 

    end

    context "when there is a censor rule" do
      it "should replace the attachment name" 

    end
  end

  describe "follow links" do
    context "when the request is a normal request" do
      it "should show a follow link" 

    end

    context "when the request is a pro request" do
      it "should not show a follow link" 

    end
  end

  describe "action"
end

