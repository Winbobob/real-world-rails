# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe 'when displaying actions that can be taken with regard to a request' do
  let(:info_request) { FactoryBot.create(:info_request) }
  let(:track_thing) do
    FactoryBot.create(:request_update_track, info_request: info_request)
  end
  let(:user) { info_request.user }
  let(:admin_user) { FactoryBot.create("admin_user") }

  before do
    assign :info_request, info_request
    assign :track_thing, track_thing
  end

  context 'if @show_owner_update_status_action is true' do
    before do
      assign :show_owner_update_status_action, false
    end

    it 'should display a link for the request owner to update the status of the request' 

  end

  context 'if @show_owner_update_status_action is false' do
    before do
      assign :show_owner_update_status_action, false
    end

    it 'should not display a link for the request owner to update the status of the request' 

  end

  context 'if @show_other_user_update_status_action is true' do
    before do
      assign :show_other_user_update_status_action, false
    end

    it 'should display a link for anyone to update the status of the request' 

  end

  context 'if @show_other_user_update_status_action is false' do
    before do
      assign :show_other_user_update_status_action, false
    end

    it 'should not display a link for anyone to update the status of the request' 

  end

  it 'should display a link for the request owner to request a review' 



  it 'should display the link to download the entire request' 


  it "should display a link to annotate the request" 


  it "should not display a link to annotate the request if comments are disabled on it" 


  it "should not display a link to annotate the request if comments are disabled globally" 


  context "when the request has not been reported" do
    it "should display a link to report it" 

  end

  context "when the request has been reported" do
    it "should display a link to the help page about why reporting is disabled" 

  end
end

