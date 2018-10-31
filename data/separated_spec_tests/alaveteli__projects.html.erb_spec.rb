# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "alaveteli_pro/info_requests/dashboard/_projects.html.erb" do
  let(:pro_user) { FactoryGirl.create(:pro_user) }

  before do
    TestAfterCommit.with_commits(true) do
      FactoryGirl.create(:info_request, user: pro_user)
      FactoryGirl.create(:waiting_clarification_info_request, user: pro_user)
      FactoryGirl.create(:successful_request, user: pro_user)
      FactoryGirl.create(:error_message_request, user: pro_user)
      FactoryGirl.create(:awaiting_description, user: pro_user)
      FactoryGirl.create(:overdue_request, user: pro_user)
      FactoryGirl.create(:very_overdue_request, user: pro_user)

      FactoryGirl.create(:draft_info_request, user: pro_user)

      public_bodies = FactoryGirl.create_list(:public_body, 10)
      FactoryGirl.create(:info_request_batch, user: pro_user,
                                              public_bodies: public_bodies)
      FactoryGirl.create(:draft_info_request_batch,
                         user: pro_user,
                         public_bodies: public_bodies)
    end
  end

  def render_view
    assign :user, pro_user
    render partial: 'alaveteli_pro/dashboard/projects'
  end

  def render_empty_view
    # Create a different user so that they have no requests
    assign :user, FactoryGirl.create(:pro_user)
    render partial: 'alaveteli_pro/dashboard/projects'
  end

  describe "All requests link" do
    context "when there are requests" do
      it "Has an 'All requests' link" 

    end

    context "when there are no requests" do
      it "Has an 'All requests' link" 

    end
  end

  describe "Request phases links" do
    context "when there are requests" do
      it "Has a link for each request phase" 

    end

    context "when there are no requests" do
      it "Has a label for each request phase" 

    end
  end

  describe "Draft request link" do
    context "when there are requests" do
      it "Has a link for draft requests" 

    end

    context "when there are no requests" do
      it "Has a label for draft requests" 

    end
  end
end

