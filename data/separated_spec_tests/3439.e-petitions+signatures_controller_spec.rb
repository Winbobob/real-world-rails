require 'rails_helper'

RSpec.describe Admin::SignaturesController, type: :controller, admin: true do
  let!(:petition) { FactoryBot.create(:open_petition) }
  let!(:signature) { FactoryBot.create(:validated_signature, petition: petition, email: "user@example.com") }

  context "not logged in" do
    describe "GET /admin/signatures" do
      it "redirects to the login page" 

    end

    describe "DELETE /admin/signatures/:id" do
      it "redirects to the login page" 

    end
  end

  context "logged in as moderator user but need to reset password" do
    let(:user) { FactoryBot.create(:moderator_user, force_password_reset: true) }
    before { login_as(user) }

    describe "GET /admin/signatures" do
      it "redirects to the login page" 

    end

    describe "DELETE /admin/signatures/:id" do
      it "redirects to edit profile page" 

    end
  end

  context "logged in as moderator user" do
    let(:user) { FactoryBot.create(:moderator_user) }
    let(:token) { SecureRandom.base64(32) }
    let(:verifier) { ActiveSupport::MessageVerifier.new(token, serializer: JSON) }
    let(:signature_ids) { verifier.generate([signature.id]) }

    before do
      login_as(user)
      session[:_bulk_verification_token] = token
    end

    describe "GET /admin/signatures" do
      before { get :index, q: "Alice" }

      it "returns 200 OK" 


      it "renders the :index template" 

    end

    describe "POST /admin/signatures/:id/validate" do
      context "when the signature is validated" do
        before do
          expect(Signature).to receive(:find).with(signature.id.to_s).and_return(signature)
          expect(signature).to receive(:validate!).and_return(true)
          post :validate, id: signature.id, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash notice message" 

      end

      context "when the signature is not validated" do
        let(:exception) { ActiveRecord::StatementInvalid.new("Invalid SQL") }

        before do
          expect(Signature).to receive(:find).with(signature.id.to_s).and_return(signature)
          expect(signature).to receive(:validate!).and_raise(exception)
          expect(Appsignal).to receive(:send_exception).with(exception)
          post :validate, id: signature.id, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end
    end

    describe "POST /admin/signatures/:id/invalidate" do
      context "when the signature is validated" do
        before do
          expect(Signature).to receive(:find).with(signature.id.to_s).and_return(signature)
          expect(signature).to receive(:invalidate!).and_return(true)
          post :invalidate, id: signature.id, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash notice message" 

      end

      context "when the signature is not validated" do
        let(:exception) { ActiveRecord::StatementInvalid.new("Invalid SQL") }

        before do
          expect(Signature).to receive(:find).with(signature.id.to_s).and_return(signature)
          expect(signature).to receive(:invalidate!).and_raise(exception)
          expect(Appsignal).to receive(:send_exception).with(exception)
          post :invalidate, id: signature.id, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end
    end

    describe "POST /admin/signatures/:id/subscribe" do
      before do
        signature.update!(notify_by_email: false)
      end

      context "and the update succeeds" do
        it "redirects to the search page" 


        it "sets the flash notice message" 


        it "changes the notify_by_email attribute" 

      end

      context "and the update fails" do
        before do
          expect(Signature).to receive(:find).with(signature.id.to_s).and_return(signature)
          expect(signature).to receive(:update).with(notify_by_email: true).and_return(false)
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end
    end

    describe "POST /admin/signatures/:id/unsubscribe" do
      before do
        signature.update!(notify_by_email: true)
      end

      context "and the update succeeds" do
        it "redirects to the search page" 


        it "sets the flash notice message" 


        it "changes the notify_by_email attribute" 

      end

      context "and the update fails" do
        before do
          expect(Signature).to receive(:find).with(signature.id.to_s).and_return(signature)
          expect(signature).to receive(:update).with(notify_by_email: false).and_return(false)
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end
    end

    describe "DELETE /admin/signatures/:id" do
      context "when the signature is destroyed" do
        before do
          expect(Signature).to receive(:find).with(signature.id.to_s).and_return(signature)
          expect(signature).to receive(:destroy).and_return(true)
          delete :destroy, id: signature.id, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash notice message" 

      end

      context "when the signature is not destroyed" do
        before do
          expect(Signature).to receive(:find).with(signature.id.to_s).and_return(signature)
          expect(signature).to receive(:destroy).and_return(false)
          delete :destroy, id: signature.id, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end
    end

    describe "POST /admin/signatures/validate" do
      context "when the signature is validated" do
        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:validate!).and_return(true)
          post :bulk_validate, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash notice message" 

      end

      context "when the signature is not validated" do
        let(:exception) { ActiveRecord::StatementInvalid.new("Invalid SQL") }

        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:validate!).and_raise(exception)
          expect(Appsignal).to receive(:send_exception).with(exception)
          post :bulk_validate, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end

      context "when the signature ids hmac is missing" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end

      context "when the selected_ids param contains an invalid id" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end
    end

    describe "POST /admin/signatures/invalidate" do
      context "when the signature is invalidated" do
        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:invalidate!).and_return(true)
          post :bulk_invalidate, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash notice message" 

      end

      context "when the signature is not invalidated" do
        let(:exception) { ActiveRecord::StatementInvalid.new("Invalid SQL") }

        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:invalidate!).and_raise(exception)
          expect(Appsignal).to receive(:send_exception).with(exception)
          post :bulk_invalidate, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end

      context "when the signature ids hmac is missing" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end

      context "when the selected_ids param contains an invalid id" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end
    end

    describe "POST /admin/signatures/subscribe" do
      context "when the signature is subcribed" do
        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:update!).with(notify_by_email: true).and_return(true)
          post :bulk_subscribe, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash notice message" 

      end

      context "when the signature is not subscribed" do
        let(:exception) { ActiveRecord::StatementInvalid.new("Invalid SQL") }

        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:update!).with(notify_by_email: true).and_raise(exception)
          expect(Appsignal).to receive(:send_exception).with(exception)
          post :bulk_subscribe, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end

      context "when the signature ids hmac is missing" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end

      context "when the selected_ids param contains an invalid id" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end
    end

    describe "POST /admin/signatures/unsubscribe" do
      context "when the signature is unsubcribed" do
        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:update!).with(notify_by_email: false).and_return(true)
          post :bulk_unsubscribe, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash notice message" 

      end

      context "when the signature is not unsubscribed" do
        let(:exception) { ActiveRecord::StatementInvalid.new("Invalid SQL") }

        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:update!).with(notify_by_email: false).and_raise(exception)
          expect(Appsignal).to receive(:send_exception).with(exception)
          post :bulk_unsubscribe, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end

      context "when the signature ids hmac is missing" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end

      context "when the selected_ids param contains an invalid id" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end
    end

    describe "DELETE /admin/signatures" do
      context "when the signature is destroyed" do
        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:destroy!).and_return(true)
          delete :bulk_destroy, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash notice message" 

      end

      context "when the signature is not destroyed" do
        let(:exception) { ActiveRecord::RecordNotDestroyed.new("Cannot delete the creator signature") }

        before do
          expect(Signature).to receive(:find).with([signature.id]).and_return([signature])
          expect(signature).to receive(:destroy!).and_raise(exception)
          expect(Appsignal).to receive(:send_exception).with(exception)
          delete :bulk_destroy, selected_ids: signature.id, all_ids: signature_ids, q: "user@example.com"
        end

        it "redirects to the search page" 


        it "sets the flash alert message" 

      end

      context "when the signature ids hmac is missing" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end

      context "when the selected_ids param contains an invalid id" do
        before do
          expect(Signature).not_to receive(:find)
        end

        it "returns a 400 Bad Request" 

      end
    end
  end
end

