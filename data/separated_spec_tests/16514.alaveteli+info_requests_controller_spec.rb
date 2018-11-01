# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AlaveteliPro::InfoRequestsController do
  let(:pro_user) { FactoryBot.create(:pro_user) }

  describe "GET #index" do
    let!(:info_request) do
      request = nil
      TestAfterCommit.with_commits(true) do
        request = FactoryBot.create(:info_request, :user => pro_user)
      end
      request
    end

    let!(:foo_request) do
      request = nil
      TestAfterCommit.with_commits(true) do
        request = FactoryBot.create(:info_request, :user => pro_user,
                                                   :title => 'Foo foo')
      end
      request
    end

    before do
      session[:user_id] = info_request.user.id
    end

    it "exists" 


    it "assigns a request filter" 


    context 'when no filters, searches or sort params are passed' do

      it "assigns the user's request summaries" 

    end

    context 'when a search is passed' do

      it 'applies the search' 


    end

  end

  describe "#preview" do
    let(:draft) do
      FactoryBot.create(:draft_info_request, body: nil, user: pro_user)
    end

    context "when there are errors on the outgoing message" do
      it "removes duplicate errors from the info_request" 

    end

    context "when the public body is not requestable" do
      let(:public_body) { FactoryBot.create(:defunct_public_body) }
      let(:draft) do
        FactoryBot.create(:draft_info_request, public_body: public_body,
                                               user: pro_user)
      end

      it "renders a message to tell the user" 

    end
  end

  describe "#create" do
    let(:draft) do
      FactoryBot.create(:draft_info_request, body: nil, user: pro_user)
    end

    context "when there are errors on the outgoing message" do
      it "removes duplicate errors from the info_request" 

    end
  end

  describe "#update" do
    let(:pro_user) { FactoryBot.create(:pro_user) }
    let(:other_pro_user) { FactoryBot.create(:pro_user) }
    let(:info_request) { FactoryBot.create(:info_request, user: pro_user) }

    context "when the user is not allowed to update the request" do
      it "raises a CanCan::AccessDenied error" 

    end
  end
end

