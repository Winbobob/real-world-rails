# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe 'when showing the form for describing the state of a request' do
  let(:info_request) { FactoryBot.create(:info_request) }
  let(:user) { info_request.user }

  def expect_radio_button(value)
    do_render
    expect(response.body).to have_css("input[type=radio][value=#{value}]")
  end

  def expect_no_radio_button(value)
    do_render
    expect(response.body).not_to have_css("input[type=radio][value=#{value}]")
  end

  def do_render
    render :partial => 'request/describe_state', :locals => {:id_suffix => '1'}
  end

  before do
    assign :info_request, info_request
    allow(view).to receive(:authenticated_user).and_return(user)
  end

  describe 'if the user is a regular user (not the request owner)' do
    before do
      assign :is_owning_user, false
      assign :state_transitions, info_request.state.transitions(
        is_owning_user: false,
        user_asked_to_update_status: false)
    end

    describe 'if the request is not old and unclassified' do
      it 'should not show the form' 


      it 'should give a link to login' 

    end

    describe 'if the request is old and unclassified' do
      before do
        assign :old_unclassified, true
      end

      it 'should not show the form' 


      it 'should show the form for someone else to classify the request' 


      it 'should not give a link to login' 

    end
  end

  describe 'if showing the form to the user owning the request' do
    before do
      assign :is_owning_user, true
      assign :state_transitions, info_request.state.transitions(
        is_owning_user: true,
        user_asked_to_update_status: false)
    end

    describe 'when the request is not in internal review' do
      before do
        info_request.set_described_state('waiting_response')
        assign :state_transitions, info_request.state.transitions(
          is_owning_user: true,
          user_asked_to_update_status: false)
      end

      it 'should show a radio button to set the status to "waiting response"' 


      it 'should show a radio button to set the status to "waiting clarification"' 


      it 'should not show a radio button to set the status to "internal_review"' 

    end

    describe 'when the user has asked to update the status of the request' do
      before do
        assign :update_status, true
        assign :state_transitions, info_request.state.transitions(
          is_owning_user: true,
          user_asked_to_update_status: true)
      end

      it 'should show a radio button to set the status to "internal_review"' 


      it 'should show a radio button to set the status to "requires_admin"' 


      it 'should show a radio button to set the status to "user_withdrawn"' 

    end

    describe 'when the request is in internal review' do
      before do
        info_request.set_described_state('internal_review')
        assign :state_transitions, info_request.state.transitions(
          is_owning_user: true,
          user_asked_to_update_status: false)
      end

      it 'should show a radio button to set the status to "internal review"' 


      it 'should show the text "The review has finished and overall:"' 

    end

    describe 'when request is awaiting a description and the user has not asked to update the status' do
    end

    it 'should show a radio button to set the status to "gone postal"' 


    it 'should show a radio button to set the status to "not held"' 


    it 'should show a radio button to set the status to "partially successful"' 


    it 'should show a radio button to set the status to "successful"' 


    it 'should show a radio button to set the status to "rejected"' 


    it 'should show a radio button to set the status to "error_message"' 


    it 'should not show a radio button to set the status to "requires_admin"' 


    it 'should not show a radio button to set the status to "user_withdrawn"' 

  end
end

