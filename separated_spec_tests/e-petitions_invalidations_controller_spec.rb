require 'rails_helper'

RSpec.describe Admin::InvalidationsController, type: :controller, admin: true do
  context "when not logged in" do
    [
      ["GET", "/admin/invalidations", :index, {}],
      ["GET", "/admin/invalidations", :new, {}],
      ["POST", "/admin/invalidations", :create, {}],
      ["GET", "/admin/invalidations/:id/edit", :edit, { id: 1 }],
      ["PATCH", "/admin/invalidations/:id", :update, { id: 1 }],
      ["DELETE", "/admin/invalidations/:id", :destroy, { id: 1 }],
      ["POST", "/admin/invalidations/:id/cancel", :cancel, { id: 1 }],
      ["POST", "/admin/invalidations/:id/count", :count, { id: 1 }],
      ["POST", "/admin/invalidations/:id/start", :start, { id: 1 }]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the login page" 

      end

    end
  end

  context "when logged in as a moderator" do
    let(:moderator) { FactoryBot.create(:moderator_user) }
    before { login_as(moderator) }

    [
      ["GET", "/admin/invalidations", :index, {}],
      ["GET", "/admin/invalidations", :new, {}],
      ["POST", "/admin/invalidations", :create, {}],
      ["GET", "/admin/invalidations/:id/edit", :edit, { id: 1 }],
      ["PATCH", "/admin/invalidations/:id", :update, { id: 1 }],
      ["DELETE", "/admin/invalidations/:id", :destroy, { id: 1 }],
      ["POST", "/admin/invalidations/:id/cancel", :cancel, { id: 1 }],
      ["POST", "/admin/invalidations/:id/count", :count, { id: 1 }],
      ["POST", "/admin/invalidations/:id/start", :start, { id: 1 }]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the admin hub page" 

      end

    end
  end

  context "when logged in as a sysadmin" do
    let(:sysadmin) { FactoryBot.create(:sysadmin_user) }
    before { login_as(sysadmin) }

    describe "GET /admin/invalidations" do
      before { get :index }

      it "returns 200 OK" 


      it "renders the :index template" 

    end

    describe "GET /admin/invalidations/new" do
      before { get :new }

      it "returns 200 OK" 


      it "renders the :new template" 

    end

    describe "POST /admin/invalidations" do
      before { post :create, invalidation: params }

      context "with invalid params" do
        let :params do
          { summary: "Invalidate some signatures" }
        end

        it "returns 200 OK" 


        it "renders the :new template" 

      end

      context "with valid params" do
        let :params do
          { summary: "Invalidate some signatures", email: "user@example.com" }
        end

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end
    end

    describe "GET /admin/invalidations/:id/edit" do
      before { get :edit, id: invalidation.id }

      context "when the invalidation is still pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, email: "user@example.com") }

        it "returns 200 OK" 


        it "renders the :edit template" 

      end

      context "when the invalidation is not pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, :completed, email: "user@example.com") }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end
    end

    describe "PATCH /admin/invalidations/:id" do
      before { patch :update, id: invalidation.id, invalidation: params }

      context "when the invalidation is still pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, email: "user@example.com") }

        context "and the params are invalid" do
          let :params do
            { summary: "Invalidate some signatures", email: "" }
          end

          it "returns 200 OK" 


          it "renders the :edit template" 

        end

        context "and the params are valid" do
          let :params do
            { summary: "Invalidate some signatures", email: "user@example.com" }
          end

          it "redirects to the index page" 


          it "sets the flash notice message" 

        end
      end

      context "when the invalidation is not pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, :completed, email: "user@example.com") }

        let :params do
          { summary: "Invalidate some signatures", email: "user@example.com" }
        end

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end
    end

    describe "DELETE /admin/invalidations/:id" do
      context "when the invalidation is still pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, email: "user@example.com") }

        before { delete :destroy, id: invalidation.id }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end

      context "when the invalidation is cancelled, but not started" do
        let(:invalidation) { FactoryBot.create(:invalidation, :cancelled, email: "user@example.com") }

        before { delete :destroy, id: invalidation.id }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end

      context "when the invalidation is not pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, :started, email: "user@example.com") }

        before { delete :destroy, id: invalidation.id }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end

      context "when the destroy fails for an unknown reason" do
        let(:invalidation) { FactoryBot.create(:invalidation, email: "user@example.com") }
        let(:id) { invalidation.id.to_s }

        before do
          expect(Invalidation).to receive(:find).with(id).and_return(invalidation)
          expect(invalidation).to receive(:destroy).and_return(false)
          delete :destroy, id: invalidation.id
        end

        it "redirects to the index page" 


        it "sets the flash alert message" 

      end
    end

    describe "POST /admin/invalidations/:id/cancel" do
      context "when the invalidation has not completed" do
        let(:invalidation) { FactoryBot.create(:invalidation, :started, email: "user@example.com") }

        before { post :cancel, id: invalidation.id }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end

      context "when the invalidation has completed" do
        let(:invalidation) { FactoryBot.create(:invalidation, :completed, email: "user@example.com") }

        before { post :cancel, id: invalidation.id }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end

      context "when the cancel fails for an unknown reason" do
        let(:invalidation) { FactoryBot.create(:invalidation, email: "user@example.com") }
        let(:id) { invalidation.id.to_s }

        before do
          expect(Invalidation).to receive(:find).with(id).and_return(invalidation)
          expect(invalidation).to receive(:cancel!).and_return(false)
          post :cancel, id: invalidation.id
        end

        it "redirects to the index page" 


        it "sets the flash alert message" 

      end
    end

    describe "POST /admin/invalidations/:id/count" do
      context "when the invalidation is still pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, email: "user@example.com") }

        before { post :count, id: invalidation.id }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end

      context "when the invalidation is no longer pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, :started, email: "user@example.com") }

        before { post :count, id: invalidation.id }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end

      context "when the count fails for an unknown reason" do
        let(:invalidation) { FactoryBot.create(:invalidation, email: "user@example.com") }
        let(:id) { invalidation.id.to_s }

        before do
          expect(Invalidation).to receive(:find).with(id).and_return(invalidation)
          expect(invalidation).to receive(:count!).and_return(false)
          post :count, id: invalidation.id
        end

        it "redirects to the index page" 


        it "sets the flash alert message" 

      end
    end

    describe "POST /admin/invalidations/:id/start" do
      context "when the invalidation is still pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, email: "user@example.com") }

        before { post :start, id: invalidation.id }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end

      context "when the invalidation is no longer pending" do
        let(:invalidation) { FactoryBot.create(:invalidation, :started, email: "user@example.com") }

        before { post :start, id: invalidation.id }

        it "redirects to the index page" 


        it "sets the flash notice message" 

      end

      context "when the start fails for an unknown reason" do
        let(:invalidation) { FactoryBot.create(:invalidation, email: "user@example.com") }
        let(:id) { invalidation.id.to_s }

        before do
          expect(Invalidation).to receive(:find).with(id).and_return(invalidation)
          expect(invalidation).to receive(:start!).and_return(false)
          post :start, id: invalidation.id
        end

        it "redirects to the index page" 


        it "sets the flash alert message" 

      end
    end
  end
end

