require 'rails_helper'

RSpec.describe SignaturesController, type: :controller do
  before do
    constituency = FactoryBot.create(:constituency, :london_and_westminster)
    allow(Constituency).to receive(:find_by_postcode).with("SW1A1AA").and_return(constituency)
  end

  describe "GET /petitions/:petition_id/signatures/new" do
    context "when the petition doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[pending validated sponsored flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    %w[closed rejected].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        before do
          get :new, petition_id: petition.id
        end

        it "assigns the @petition instance variable" 


        it "redirects to the petition page" 

      end
    end

    context "when the petition is open" do
      let(:petition) { FactoryBot.create(:open_petition) }

      before do
        get :new, petition_id: petition.id
      end

      it "assigns the @petition instance variable" 


      it "assigns the @signature instance variable with a new signature" 


      it "sets the signature's location_code to 'GB'" 


      it "renders the signatures/new template" 

    end
  end

  describe "POST /petitions/:petition_id/signatures/new" do
    let(:params) do
      {
        name: "Ted Berry",
        email: "ted@example.com",
        uk_citizenship: "1",
        postcode: "SW1A 1AA",
        location_code: "GB"
      }
    end

    context "when the petition doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[pending validated sponsored flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    %w[closed rejected].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        before do
          post :confirm, petition_id: petition.id, signature: params
        end

        it "assigns the @petition instance variable" 


        it "redirects to the petition page" 

      end
    end

    context "when the petition is open" do
      let(:petition) { FactoryBot.create(:open_petition) }

      before do
        post :confirm, petition_id: petition.id, signature: params
      end

      it "assigns the @petition instance variable" 


      it "assigns the @signature instance variable with a new signature" 


      it "sets the signature's params" 


      it "records the IP address on the signature" 


      it "renders the signatures/confirm template" 


      context "and the params are invalid" do
        let(:params) do
          {
            name: "Ted Berry",
            email: "",
            uk_citizenship: "1",
            postcode: "12345",
            location_code: "GB"
          }
        end

        it "renders the signatures/new template" 

      end
    end
  end

  describe "POST /petitions/:petition_id/signatures" do
    let(:params) do
      {
        name: "Ted Berry",
        email: "ted@example.com",
        uk_citizenship: "1",
        postcode: "SW1A 1AA",
        location_code: "GB"
      }
    end

    context "when the petition doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[pending validated sponsored flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    %w[closed rejected].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        before do
          post :create, petition_id: petition.id, signature: params
        end

        it "assigns the @petition instance variable" 


        it "redirects to the petition page" 

      end
    end

    context "when the petition is open" do
      let(:petition) { FactoryBot.create(:open_petition) }

      context "and the signature is not a duplicate" do
        before do
          perform_enqueued_jobs {
            post :create, petition_id: petition.id, signature: params
          }
        end

        it "assigns the @petition instance variable" 


        it "assigns the @signature instance variable with a saved signature" 


        it "sets the signature's params" 


        it "records the IP address on the signature" 


        it "sends a confirmation email" 


        it "redirects to the thank you page" 


        context "and the params are invalid" do
          let(:params) do
            {
              name: "Ted Berry",
              email: "",
              uk_citizenship: "1",
              postcode: "SW1A 1AA",
              location_code: "GB"
            }
          end

          it "renders the signatures/new template" 

        end
      end

      context "and the signature is a pending duplicate" do
        let!(:signature) { FactoryBot.create(:pending_signature, params.merge(petition: petition)) }

        before do
          perform_enqueued_jobs {
            post :create, petition_id: petition.id, signature: params
          }
        end

        it "assigns the @petition instance variable" 


        it "assigns the @signature instance variable to the original signature" 


        it "re-sends the confirmation email" 


        it "redirects to the thank you page" 

      end

      context "and the signature is a validated duplicate" do
        let!(:signature) { FactoryBot.create(:validated_signature, params.merge(petition: petition)) }

        before do
          perform_enqueued_jobs {
            post :create, petition_id: petition.id, signature: params
          }
        end

        it "assigns the @petition instance variable" 


        it "assigns the @signature instance variable to the original signature" 


        it "sends a duplicate signature email" 


        it "redirects to the thank you page" 

      end
    end
  end

  describe "GET /petitions/:petition_id/signatures/thank-you" do
    context "when the petition doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[pending validated sponsored flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    context "when the petition was rejected" do
      let(:petition) { FactoryBot.create(:rejected_petition) }

      before do
        get :thank_you, petition_id: petition.id
      end

      it "assigns the @petition instance variable" 


      it "sets the flash :notice message" 


      it "redirects to the petition page" 

    end

    context "when the petition was closed more than 24 hours ago" do
      let(:petition) { FactoryBot.create(:closed_petition, closed_at: 36.hours.ago) }
      let(:signature) { FactoryBot.create(:validated_signature, petition: petition) }

      before do
        get :thank_you, petition_id: petition.id
      end

      it "assigns the @petition instance variable" 


      it "sets the flash :notice message" 


      it "redirects to the petition page" 

    end

    context "when the petition was closed less than 24 hours ago" do
      let(:petition) { FactoryBot.create(:closed_petition, closed_at: 12.hours.ago) }
      let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition) }

      before do
        get :thank_you, petition_id: petition.id
      end

      it "assigns the @petition instance variable" 


      it "sets the flash :notice message" 


      it "redirects to the petition page" 

    end

    context "when the petition is open" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition) }

      before do
        get :thank_you, petition_id: petition.id
      end

      it "assigns the @petition instance variable" 


      it "renders the signatures/thank_you template" 

    end
  end

  describe "GET /signatures/:id/verify" do
    context "when the signature doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature token is invalid" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is fraudulent" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:fraudulent_signature, petition: petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is invalidated" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:invalidated_signature, petition: petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[pending validated sponsored flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    context "when the petition was rejected" do
      let(:petition) { FactoryBot.create(:rejected_petition) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

      before do
        get :verify, id: signature.id, token: signature.perishable_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "sets the flash :notice message" 


      it "redirects to the petition page" 

    end

    context "when the petition was closed more than 24 hours ago" do
      let(:petition) { FactoryBot.create(:closed_petition, closed_at: 36.hours.ago) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

      before do
        get :verify, id: signature.id, token: signature.perishable_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "sets the flash :notice message" 


      it "redirects to the petition page" 

    end

    context "when the petition was closed less than 24 hours ago" do
      let(:petition) { FactoryBot.create(:closed_petition, closed_at: 12.hours.ago) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

      before do
        get :verify, id: signature.id, token: signature.perishable_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "validates the signature" 


      it "records the constituency id on the signature" 


      it "redirects to the signed signature page" 

    end

    context "when the petition is open" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

      before do
        get :verify, id: signature.id, token: signature.perishable_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "validates the signature" 


      it "records the constituency id on the signature" 


      it "redirects to the signed signature page" 


      context "and the signature has already been validated" do
        let(:signature) { FactoryBot.create(:validated_signature, petition: petition) }

        it "doesn't set the flash :notice message" 

      end
    end
  end

  describe "GET /signatures/:id/signed" do
    context "when the signature doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature token is invalid" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is fraudulent" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:fraudulent_signature, petition: petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is invalidated" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:invalidated_signature, petition: petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[pending validated sponsored flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    context "when the petition was rejected" do
      let(:petition) { FactoryBot.create(:rejected_petition) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

      before do
        get :signed, id: signature.id, token: signature.perishable_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "sets the flash :notice message" 


      it "redirects to the petition page" 

    end

    context "when the petition was closed more than 24 hours ago" do
      let(:petition) { FactoryBot.create(:closed_petition, closed_at: 36.hours.ago) }
      let(:signature) { FactoryBot.create(:validated_signature, petition: petition) }

      before do
        get :signed, id: signature.id, token: signature.perishable_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "sets the flash :notice message" 


      it "redirects to the petition page" 

    end

    context "when the petition was closed less than 24 hours ago" do
      let(:petition) { FactoryBot.create(:closed_petition, closed_at: 12.hours.ago) }
      let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition) }

      before do
        get :signed, id: signature.id, token: signature.perishable_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "marks the signature has having seen the confirmation page" 


      it "renders the signatures/signed template" 

    end

    context "when the petition is open" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition) }

      before do
        get :signed, id: signature.id, token: signature.perishable_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "marks the signature has having seen the confirmation page" 


      it "renders the signatures/signed template" 


      context "and the signature has not been validated" do
        let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

        it "redirects to the verify page" 

      end

      context "and the signature has already seen the confirmation page" do
        let(:signature) { FactoryBot.create(:validated_signature, petition: petition) }

        it "doesn't redirect to the petition page" 

      end
    end
  end

  describe "GET /signatures/:id/unsubscribe" do
    context "when the signature doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature token is invalid" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is fraudulent" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:fraudulent_signature, petition: petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is invalidated" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:invalidated_signature, petition: petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[pending validated sponsored flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    context "when the petition was rejected" do
      let(:petition) { FactoryBot.create(:rejected_petition) }
      let(:signature) { FactoryBot.create(:validated_signature, petition: petition) }

      before do
        get :unsubscribe, id: signature.id, token: signature.unsubscribe_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "unsubscribes from email updates" 


      it "renders the signatures/unsubscribe template" 

    end

    context "when the petition was closed more than 24 hours ago" do
      let(:petition) { FactoryBot.create(:closed_petition, closed_at: 36.hours.ago) }
      let(:signature) { FactoryBot.create(:validated_signature, petition: petition) }

      before do
        get :unsubscribe, id: signature.id, token: signature.unsubscribe_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "unsubscribes from email updates" 


      it "renders the signatures/unsubscribe template" 

    end

    context "when the petition was closed less than 24 hours ago" do
      let(:petition) { FactoryBot.create(:closed_petition, closed_at: 12.hours.ago) }
      let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition) }

      before do
        get :unsubscribe, id: signature.id, token: signature.unsubscribe_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "unsubscribes from email updates" 


      it "renders the signatures/unsubscribe template" 

    end

    context "when the petition is open" do
      let(:petition) { FactoryBot.create(:open_petition) }
      let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition) }

      before do
        get :unsubscribe, id: signature.id, token: signature.unsubscribe_token
      end

      it "assigns the @signature instance variable" 


      it "assigns the @petition instance variable" 


      it "unsubscribes from email updates" 


      it "renders the signatures/unsubscribe template" 

    end
  end
end

