# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe 'request/_sidebar.html.erb' do
  let(:info_request) { FactoryBot.create(:info_request) }
  let(:track_thing) do
    FactoryBot.create(:track_thing, info_request: info_request)
  end
  let(:public_body) { info_request.public_body }
  let(:user) { info_request.user }
  let(:admin_user) { FactoryBot.create("admin_user") }

  def render_page
    assign :info_request, info_request
    assign :track_thing, track_thing
    assign :status, info_request.calculate_status
    render
  end

  context "when the request has been reported" do
    before :each do
      info_request.report!("", "", nil)
    end

    context "and the request is hidden" do
      it "tell admins it's hidden" 

    end

    context "and the request is requester only" do
      it "should tell the user that only they can see it" 

    end

    context "and then deemed okay and left to complete" do
      it "should let the user know that the admins have not hidden it" 

    end
  end
end

