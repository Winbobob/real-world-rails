# -*- encoding : utf-8 -*-
require 'spec_helper'

shared_examples_for "an info_request_batch action" do
  it "sets @draft_info_request_batch from the draft_id param" 


  context "if the specified draft doesn't exist" do
    it "raises ActiveRecord::RecordNotFound" 

  end

  context "if the current_user doesn't own the specified draft" do
    before do
      session[:user_id] = other_user.id
    end

    it "raises ActiveRecord::RecordNotFound" 

  end

  it "sets @info_request_batch" 


  it "sets @example_info_request" 


  it "sets @outgoing_message" 


  context "when an embargo_duration is set on the draft" do
    before do
      draft.embargo_duration = "12_months"
      draft.save
    end

    it "sets @embargo to an embargo with the same emabrgo_duration" 

  end

  context "when the embargo_duration is set to publish immediately on the draft" do
    before do
      draft.embargo_duration = ""
      draft.save
    end

    it "does not set @embargo" 

  end

  context "when no embargo_duration is set on the draft" do
    before do
      draft.embargo_duration = nil
      draft.save
    end

    it "does not set @embargo" 

  end
end

describe AlaveteliPro::InfoRequestBatchesController do
  let(:body_1) { FactoryBot.create(:public_body) }
  let(:body_2) { FactoryBot.create(:public_body) }
  let(:bodies) { [body_1, body_2] }
  let(:user) { FactoryBot.create(:pro_user) }
  let(:other_user) { FactoryBot.create(:pro_user) }
  let!(:draft) do
    FactoryBot.create(:draft_info_request_batch,
                      public_bodies: bodies,
                      user: user)
  end
  let(:params) { {draft_id: draft.id} }

  before do
    session[:user_id] = user.id
  end

  describe "#new" do
    let(:action) { get :new, params }

    it_behaves_like "an info_request_batch action"

    it "renders alaveteli_pro/info_requests/new.html.erb" 

  end

  describe "#preview" do
    let(:action) { get :preview, params }

    it_behaves_like "an info_request_batch action"

    context "when everything is valid" do
      it "renders alaveteli_pro/info_requests/preview.html.erb" 

    end

    context "when the draft is not valid" do
      before do
        draft.body = ""
        draft.title = ""
        draft.save
      end

      it "removes duplicate errors" 


      it "renders alaveteli_pro/info_requests/new.html.erb" 

    end
  end


  describe "#create" do
    let(:params) { {draft_id: draft.id} }
    let(:action) { post :create, params }

    it_behaves_like "an info_request_batch action"

    context "when everything is valid" do
      it "creates an info_request_batch" 


      it "destroys the draft" 


      it "redirects to show the batch" 

    end

    context 'when a user is below the rate limit' do
      before(:each) do
        limiter = double
        allow(limiter).to receive(:record)
        allow(limiter).to receive(:limit?).and_return(false)
        allow(controller).to receive(:rate_monitor).and_return(limiter)
      end

      it 'does not send a notification' 

    end

    context 'when a user hits the rate limit' do
      before(:each) do
        limiter = double
        allow(limiter).to receive(:record)
        allow(limiter).to receive(:limit?).and_return(true)
        allow(controller).to receive(:rate_monitor).and_return(limiter)
      end

      it 'sends a notification' 

    end

    context "when the draft is not valid" do
      before do
        draft.body = ""
        draft.title = ""
        draft.save
      end

      it "removes duplicate errors" 


      it "renders alaveteli_pro/info_requests/new.html.erb" 

    end
  end
end

