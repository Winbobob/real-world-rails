# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', '..', 'spec_helper'), __FILE__)

describe 'when displaying actions that can be taken with regard to a pro request' do
  let(:info_request) { FactoryGirl.create(:info_request) }
  let(:pro_user) { info_request.pro_user }
  let(:admin_user) { FactoryGirl.create("admin_user") }

  before do
    assign :info_request, info_request
  end

  def render_view
    render :partial => 'alaveteli_pro/info_requests/after_actions'
  end

  it 'should display a link to request a review' 


  it 'should display the link to download the entire request' 


  it "should display a link to annotate the request" 


  it "should not display a link to annotate the request if comments are disabled on it" 


  it "should not display a link to annotate the request if comments are disabled globally" 


  context "when there is a response" do
    let(:info_request) { FactoryGirl.create(:info_request_with_incoming) }

    before do
      assign :info_request, info_request
      assign :last_response, info_request.get_last_public_response
    end

    it "should display a link to reply" 

  end

  context "when there is no response" do
    before do
      assign :last_response, nil
    end

    it "should display a link to send a follow up" 

  end
end

