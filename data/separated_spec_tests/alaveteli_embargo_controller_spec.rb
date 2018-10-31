# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AlaveteliPro::EmbargoesController do
  let(:pro_user) { FactoryGirl.create(:pro_user) }

  let(:admin) do
    user = FactoryGirl.create(:pro_admin_user)
    user.roles << Role.find_by(name: 'pro')
    user
  end
  let(:info_request) { FactoryGirl.create(:info_request, user: pro_user) }
  let(:embargo) { FactoryGirl.create(:embargo, info_request: info_request) }

  describe '#create' do
    let(:info_request) { FactoryGirl.create(:info_request, user: pro_user) }

    context 'when the user is allowed to add an embargo' do

      context 'because they are the owner' do
        before do
          with_feature_enabled(:alaveteli_pro) do
            session[:user_id] = pro_user.id
            post :create, { alaveteli_pro_embargo: {
                            info_request_id: info_request,
                            embargo_duration: '3_months' }
                          }
          end
        end

        it 'creates the embargo' 


        it 'sets the expected duration' 


      end

      context 'because they are a pro admin' do
        before do
          with_feature_enabled(:alaveteli_pro) do
            session[:user_id] = admin.id
            post :create, { alaveteli_pro_embargo: {
                            info_request_id: info_request,
                            embargo_duration: '3_months' }
                          }
          end
        end

        it 'creates the embargo' 


        it 'sets the expected duration' 


      end

    end

    context "when the user is not allowed to update the embargo" do
      let(:other_user) { FactoryGirl.create(:pro_user) }

      it "raises a CanCan::AccessDenied error" 


    end

    context "when the info_request is part of a batch request" do
      let(:info_request_batch) { FactoryGirl.create(:info_request_batch) }

      before do
        info_request.info_request_batch = info_request_batch
        info_request.save!
      end

      it "raises a CanCan::AccessDenied error" 


    end

  end

  describe "#destroy" do
    context "when the user is allowed to remove the embargo" do
      context "because they are the owner" do
        before do
          with_feature_enabled(:alaveteli_pro) do
            session[:user_id] = pro_user.id
            delete :destroy, id: embargo.id
          end
        end

        it "destroys the embargo" 


        it "logs an 'expire_embargo' event" 


        context 'they no longer have pro status' do

          before do
            pro_user.remove_role(:pro)
          end

          it 'destroys the embargo' 


        end

      end

      context "because they are an admin" do
        before do
          with_feature_enabled(:alaveteli_pro) do
            session[:user_id] = admin.id
            delete :destroy, id: embargo.id
          end
        end

        it "destroys the embargo" 


        it "logs an 'expire_embargo' event" 


      end
    end

    context "when the user is not allowed to update the embargo" do
      let(:other_user) { FactoryGirl.create(:pro_user) }

      it "raises a CanCan::AccessDenied error" 

    end

    context "when the info_request is part of a batch request" do
      let(:info_request_batch) { FactoryGirl.create(:info_request_batch) }

      before do
        info_request.info_request_batch = info_request_batch
        info_request.save!
      end

      it "raises a PermissionDenied error" 

    end
  end

  describe "#destroy_batch" do
    let(:info_request_batch) do
      batch = FactoryGirl.create(
        :info_request_batch,
        embargo_duration: "3_months",
        user: pro_user,
        public_bodies: FactoryGirl.create_list(:public_body, 2))
      batch.create_batch!
      batch
    end

    context "when the user is allowed to update the batch" do
      context "because they are the owner" do
        before do
          with_feature_enabled(:alaveteli_pro) do
            session[:user_id] = pro_user.id
            post :destroy_batch, info_request_batch_id: info_request_batch.id
          end
        end

        it "destroys all the embargoes" 


        it "sets embargo_duration to nil on the batch" 


        it "logs an 'expire_embargo' event for each request in the batch" 


        it "shows a flash message" 


        it "redirects to the batch request page" 

      end

      context "because they are an admin" do
        before do
          with_feature_enabled(:alaveteli_pro) do
            session[:user_id] = admin.id
            post :destroy_batch, info_request_batch_id: info_request_batch.id
          end
        end

        it "destroys all the embargoes" 


        it "sets embargo_duration to nil on the batch" 


        it "logs an 'expire_embargo' event for each request in the batch" 


        it "shows a flash message" 


        it "redirects to the batch request page" 

      end
    end

    context "when the user is not allowed to update the batch" do
      let(:other_user) { FactoryGirl.create(:pro_user) }

      it "raises a CanCan::AccessDenied error" 

    end

    context "when an info_request_id is supplied" do
      before do
        with_feature_enabled(:alaveteli_pro) do
          session[:user_id] = admin.id
          post :destroy_batch,
               info_request_batch_id: info_request_batch.id,
               info_request_id: info_request_batch.info_requests.first.id
        end
      end

      it "redirects to that request, not the batch" 

    end
  end
end

