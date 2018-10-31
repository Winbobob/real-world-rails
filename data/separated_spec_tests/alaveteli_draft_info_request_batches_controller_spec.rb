# -*- encoding : utf-8 -*-
require 'spec_helper'

shared_examples_for "creating a request" do
  it "creates a new DraftInfoRequestBatch" 

end

shared_examples_for "adding a body to a request" do
  it "adds the body" 


  context "if the user doesn't own the given draft" do
    let(:other_pro_user) { FactoryGirl.create(:pro_user) }

    before do
      session[:user_id] = other_pro_user.id
    end

    it "raises an ActiveRecord::RecordNotFound error" 

  end
end

shared_examples_for "removing a body from a request" do
  it "updates the given DraftInfoRequestBatch" 


  context "if the user doesn't own the given draft" do
    let(:other_pro_user) { FactoryGirl.create(:pro_user) }

    before do
      session[:user_id] = other_pro_user.id
    end

    it "raises an ActiveRecord::RecordNotFound error" 

  end
end

describe AlaveteliPro::DraftInfoRequestBatchesController do
  let(:pro_user) { FactoryGirl.create(:pro_user) }
  let(:authority_1) { FactoryGirl.create(:public_body) }
  let(:authority_2) { FactoryGirl.create(:public_body) }
  let(:authority_3) { FactoryGirl.create(:public_body) }

  before do
    session[:user_id] = pro_user.id
  end

  describe "#create" do
    let(:params) do
      {
        alaveteli_pro_draft_info_request_batch: {
          title: 'Test Batch Request',
          body: 'This is a test batch request.',
          public_body_ids: authority_1.id
        },
        authority_query: "Department"
      }
    end

    describe "when responding to a normal request" do
      subject do
        with_feature_enabled(:alaveteli_pro) do
          post :create, params
        end
      end

      it_behaves_like "creating a request"

      it "redirects to a new search if no query was provided" 


      it "redirects to an existing search if a query is provided" 


      it "respects the selected page if one is provided" 


      it "sets a :notice flash message" 

    end

    describe "when responding to an AJAX request" do
      subject do
        with_feature_enabled(:alaveteli_pro) do
          xhr :post, :create, params
        end
      end

      it_behaves_like "creating a request"

      it "renders the _summary.html.erb partial" 

    end
  end

  describe "#update_bodies" do
    let(:draft) do
      FactoryGirl.create(:draft_info_request_batch, user: pro_user)
    end

    describe "when adding a body" do
      let(:params) do
        {
          id: draft.id,
          add_body_id: authority_1.id
        }
      end

      describe "when responding to a normal request" do
        subject do
          with_feature_enabled(:alaveteli_pro) do
            put :update_bodies, params
          end
        end

        it_behaves_like "adding a body to a request"

        it "redirects to a new search if no query was provided" 


        it "redirects to an existing search if a query is provided" 


        it "respects the selected page if one is provided" 


        it "sets a :notice flash message" 

      end

      describe "responding to an AJAX request" do
        subject do
          with_feature_enabled(:alaveteli_pro) do
            xhr :put, :update_bodies, params
          end
        end

        it_behaves_like "adding a body to a request"

        it "renders the _summary.html.erb partial" 

      end
    end

    describe "when removing a body" do
      let(:params) do
        {
          id: draft.id,
          remove_body_id: authority_2.id
        }
      end

      before do
        draft.public_bodies << [authority_1, authority_2]
      end

      describe "when responding to a normal request" do
        subject do
          with_feature_enabled(:alaveteli_pro) do
            put :update_bodies, params
          end
        end

        it_behaves_like "removing a body from a request"

        it "redirects to a new search if no query was provided" 


        it "redirects to an existing search if a query is provided" 


        it "respects the selected page if one is provided" 


        it "sets a :notice flash message" 

      end

      describe "responding to an AJAX request" do
        subject do
          with_feature_enabled(:alaveteli_pro) do
            xhr :put, :update_bodies, params
          end
        end

        it_behaves_like "removing a body from a request"

        it "renders the _summary.html.erb partial" 

      end
    end
  end

  describe "#update" do
    let(:draft) do
      FactoryGirl.create(:draft_info_request_batch, user: pro_user)
    end
    let(:params) do
      {
        alaveteli_pro_draft_info_request_batch: {
          title: 'Test Batch Request',
          body: 'This is a test batch request.',
          embargo_duration: '3_months',
          public_body_ids: [authority_1.id, authority_2.id, authority_3.id]
        },
        id: draft.id
      }
    end

    it "updates the draft" 


    context "when the user is previewing" do
      before do
        params[:preview] = '1'
      end

      it "redirects to the batch preview page" 

    end

    context "when the user is saving" do
      it "redirects to the new batch page" 

    end
  end
end

