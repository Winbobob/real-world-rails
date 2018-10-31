require 'spec_helper'

describe RelatedWorksController do
  include LoginMacros
  let(:child_creator) { FactoryGirl.create(:user) }
  let(:child_work) { FactoryGirl.create(:work, authors: [child_creator.default_pseud]) }
  let(:parent_creator) { FactoryGirl.create(:user) }
  let(:parent_work) { FactoryGirl.create(:work, authors: [parent_creator.default_pseud]) }

  describe "GET #index" do
    context "for a blank user" do
      before(:each) do
        get :index, params: { user_id: "" }
      end

      it "sets a flash message" 


      it "redirects the requester" 

    end

    context "for a nonexistent user" do
      before(:each) do
        get :index, params: { user_id: "user" }
      end

      it "sets a flash message" 


      it "redirects the requester" 

    end
  end

  describe "PUT #update" do
    context "by the creator of the child work" do
      before(:each) do
        @related_work = FactoryGirl.create(:related_work, work_id: child_work.id)
        fake_login_known_user(child_creator)
        put :update, params: { id: @related_work }
      end

      it "sets a flash message" 


      it "redirects the requester" 

    end

    context "by a user who is not the creator of either work" do
      before(:each) do
        @related_work = FactoryGirl.create(:related_work)
        fake_login
        put :update, params: { id: @related_work }
      end

      it "sets a flash message" 


      it "redirects the requester" 

    end

    context "by the creator of the parent work" do
      before(:each) do
        @related_work = FactoryGirl.create(:related_work, parent_id: parent_work.id, reciprocal: true)
        fake_login_known_user(parent_creator)
      end

      context "with valid parameters" do
        before(:each) do
          put :update, params: { id: @related_work }
        end

        it "updates the related work attributes" 


        it "sets a flash message" 


        it "redirects to the parent work" 

      end

      context "with invalid parameters" do
        xit "sets a flash message" do
          expect(flash[:notice]).to eq("Sorry, something went wrong.")
        end

        xit "redirects to the related work" do
          expect(response).to redirect_to @related_work
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "by the creator of the parent work" do
      before(:each) do
        @related_work = FactoryGirl.create(:related_work, parent_id: parent_work.id, reciprocal: true)
        fake_login_known_user(parent_creator)
        delete :destroy, params: { id: @related_work }
      end

      it "sets a flash message" 


      it "redirects the requester" 

    end

    context "by a user who is not the creator of either work" do
      before(:each) do
        @related_work = FactoryGirl.create(:related_work)
        fake_login
        delete :destroy, params: { id: @related_work }
      end

      it "sets a flash message" 


      it "redirects the requester" 

    end

    context "by the creator of the child work" do
      before(:each) do
        @related_work = FactoryGirl.create(:related_work, work_id: child_work.id)
        fake_login_known_user(child_creator)
      end

      it "deletes the related work" 


      it "redirects the requester" 

    end
  end
end

