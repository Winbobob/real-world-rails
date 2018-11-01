require 'rails_helper'

RSpec.describe SponsorsController, type: :controller do
  before do
    constituency = FactoryBot.create(:constituency, :london_and_westminster)
    allow(Constituency).to receive(:find_by_postcode).with("SW1A1AA").and_return(constituency)
  end

  describe "GET /petitions/:petition_id/sponsors/new" do
    context "when the petition doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the token is invalid" do
      let(:petition) { FactoryBot.create(:pending_petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the creator's signature has not been validated" do
      let(:petition) { FactoryBot.create(:pending_petition) }
      let(:creator) { petition.creator }

      it "validates the creator's signature" 

    end

    %w[flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    %w[open closed rejected].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        before do
          get :new, petition_id: petition.id, token: petition.sponsor_token
        end

        it "assigns the @petition instance variable" 


        it "redirects to the petition page" 

      end
    end

    %w[pending validated sponsored].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        before do
          get :new, petition_id: petition.id, token: petition.sponsor_token
        end

        it "assigns the @petition instance variable" 


        it "assigns the @signature instance variable with a new signature" 


        it "sets the signature's location_code to 'GB'" 


        it "renders the sponsors/new template" 


        context "and has one remaining sponsor slot" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors - 1, sponsors_signed: true) }

          it "doesn't redirect to the petition moderation info page" 

        end

        context "and has reached the maximum number of sponsors" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors, sponsors_signed: true) }

          it "redirects to the petition moderation info page" 

        end
      end
    end
  end

  describe "POST /petitions/:petition_id/sponsors/new" do
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

    context "when the token is invalid" do
      let(:petition) { FactoryBot.create(:pending_petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    %w[open closed rejected].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        before do
          post :confirm, petition_id: petition.id, token: petition.sponsor_token, signature: params
        end

        it "assigns the @petition instance variable" 


        it "redirects to the petition page" 

      end
    end

    %w[pending validated sponsored].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        before do
          post :confirm, petition_id: petition.id, token: petition.sponsor_token, signature: params
        end

        it "assigns the @petition instance variable" 


        it "assigns the @signature instance variable with a new signature" 


        it "sets the signature's params" 


        it "records the IP address on the signature" 


        it "renders the sponsors/confirm template" 


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

          it "renders the sponsors/new template" 

        end

        context "and has one remaining sponsor slot" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors - 1, sponsors_signed: true) }

          it "doesn't redirect to the petition moderation info page" 

        end

        context "and has reached the maximum number of sponsors" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors, sponsors_signed: true) }

          it "redirects to the petition moderation info page" 

        end
      end
    end
  end

  describe "POST /petitions/:petition_id/sponsors" do
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

    context "when the token is invalid" do
      let(:petition) { FactoryBot.create(:pending_petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    %w[open closed rejected].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        before do
          post :create, petition_id: petition.id, token: petition.sponsor_token, signature: params
        end

        it "assigns the @petition instance variable" 


        it "redirects to the petition page" 

      end
    end

    %w[pending validated sponsored].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        context "and the signature is not a duplicate" do
          before do
            perform_enqueued_jobs {
              post :create, petition_id: petition.id, token: petition.sponsor_token, signature: params
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

            it "renders the sponsors/new template" 

          end
        end

        context "and the signature is a pending duplicate" do
          let!(:signature) { FactoryBot.create(:pending_signature, params.merge(petition: petition)) }

          before do
            perform_enqueued_jobs {
              post :create, petition_id: petition.id, token: petition.sponsor_token, signature: params
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
              post :create, petition_id: petition.id, token: petition.sponsor_token, signature: params
            }
          end

          it "assigns the @petition instance variable" 


          it "assigns the @signature instance variable to the original signature" 


          it "sends a duplicate signature email" 


          it "redirects to the thank you page" 

        end

        context "and has one remaining sponsor slot" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors - 1, sponsors_signed: true) }

          before do
            perform_enqueued_jobs {
              post :create, petition_id: petition.id, token: petition.sponsor_token, signature: params
            }
          end

          it "doesn't redirect to the petition moderation info page" 

        end

        context "and has reached the maximum number of sponsors" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors, sponsors_signed: true) }

          before do
            perform_enqueued_jobs {
              post :create, petition_id: petition.id, token: petition.sponsor_token, signature: params
            }
          end

          it "redirects to the petition moderation info page" 

        end
      end
    end
  end

  describe "GET /petitions/:petition_id/signatures/thank-you" do
    context "when the petition doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the token is invalid" do
      let(:petition) { FactoryBot.create(:pending_petition) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    %w[open closed rejected].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }

        before do
          get :thank_you, petition_id: petition.id, token: petition.sponsor_token
        end

        it "assigns the @petition instance variable" 


        it "doesn't redirect to the petition page" 


        it "renders the signatures/thank_you template" 

      end
    end

    %w[pending validated sponsored].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition) }

        before do
          get :thank_you, petition_id: petition.id, token: petition.sponsor_token
        end

        it "assigns the @petition instance variable" 


        it "renders the signatures/thank_you template" 


        context "and has one remaining sponsor slot" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors - 1, sponsors_signed: true) }

          it "doesn't redirect to the petition moderation info page" 


          it "renders the signatures/thank_you template" 

        end

        context "and has reached the maximum number of sponsors" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors, sponsors_signed: true) }

          it "doesn't redirect to the petition moderation info page" 


          it "renders the signatures/thank_you template" 

        end
      end
    end
  end

  describe "GET /sponsors/:id/verify" do
    context "when the signature doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature token is invalid" do
      let(:petition) { FactoryBot.create(:pending_petition) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition, sponsor: true) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is fraudulent" do
      let(:petition) { FactoryBot.create(:pending_petition) }
      let(:signature) { FactoryBot.create(:fraudulent_signature, petition: petition, sponsor: true) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is invalidated" do
      let(:petition) { FactoryBot.create(:pending_petition) }
      let(:signature) { FactoryBot.create(:invalidated_signature, petition: petition, sponsor: true) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:pending_signature, petition: petition, sponsor: true) }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    %w[open closed rejected].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:pending_signature, petition: petition, sponsor: true) }

        before do
          get :verify, id: signature.id, token: signature.perishable_token
        end

        it "assigns the @signature instance variable" 


        it "assigns the @petition instance variable" 


        it "redirects to the petition page" 

      end
    end

    %w[pending validated sponsored].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:pending_signature, petition: petition, sponsor: true) }

        before do
          get :verify, id: signature.id, token: signature.perishable_token
        end

        it "assigns the @signature instance variable" 


        it "assigns the @petition instance variable" 


        it "validates the signature" 


        it "records the constituency id on the signature" 


        it "redirects to the signed signature page" 


        context "and the signature has already been validated" do
          let(:signature) { FactoryBot.create(:validated_signature, petition: petition, sponsor: true) }

          it "doesn't set the flash :notice message" 

        end

        context "and has one remaining sponsor slot" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors - 1, sponsors_signed: true) }

          it "assigns the @signature instance variable" 


          it "assigns the @petition instance variable" 


          it "validates the signature" 


          it "redirects to the signed signature page" 

        end

        context "and has reached the maximum number of sponsors" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors, sponsors_signed: true) }

          it "redirects to the petition moderation info page" 

        end
      end
    end
  end

  describe "GET /sponsors/:id/sponsored" do
    context "when the signature doesn't exist" do
      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature token is invalid" do
      let(:petition) { FactoryBot.create(:pending_petition) }
      let(:signature) { FactoryBot.create(:pending_signature, petition: petition, sponsor: true) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is fraudulent" do
      let(:petition) { FactoryBot.create(:pending_petition) }
      let(:signature) { FactoryBot.create(:fraudulent_signature, petition: petition, sponsor: true) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    context "when the signature is invalidated" do
      let(:petition) { FactoryBot.create(:pending_petition) }
      let(:signature) { FactoryBot.create(:invalidated_signature, petition: petition, sponsor: true) }

      it "raises an ActiveRecord::RecordNotFound exception" 

    end

    %w[flagged hidden stopped].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition, sponsor: true) }

        it "raises an ActiveRecord::RecordNotFound exception" 

      end
    end

    %w[open closed rejected].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition, sponsor: true) }

        before do
          get :signed, id: signature.id, token: signature.perishable_token
        end

        it "assigns the @signature instance variable" 


        it "assigns the @petition instance variable" 


        it "doesn't redirect to the petition page" 


        it "renders the sponsors/signed template" 

      end
    end

    %w[pending validated sponsored].each do |state|
      context "when the petition is #{state}" do
        let(:petition) { FactoryBot.create(:"#{state}_petition") }
        let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition, sponsor: true) }

        before do
          get :signed, id: signature.id, token: signature.perishable_token
        end

        it "assigns the @signature instance variable" 


        it "assigns the @petition instance variable" 


        it "marks the signature has having seen the confirmation page" 


        it "renders the sponsors/signed template" 


        context "and the signature has not been validated" do
          let(:signature) { FactoryBot.create(:pending_signature, petition: petition, sponsor: true) }

          it "redirects to the verify page" 

        end

        context "and the signature has already seen the confirmation page" do
          let(:signature) { FactoryBot.create(:validated_signature, petition: petition, sponsor: true) }

          it "assigns the @signature instance variable" 


          it "assigns the @petition instance variable" 


          it "renders the sponsors/signed template" 

        end

        context "and has one remaining sponsor slot" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors - 2, sponsors_signed: true) }

          it "assigns the @signature instance variable" 


          it "assigns the @petition instance variable" 


          it "marks the signature has having seen the confirmation page" 


          it "renders the sponsors/signed template" 

        end

        context "and has reached the maximum number of sponsors" do
          let(:petition) { FactoryBot.create(:"#{state}_petition", sponsor_count: Site.maximum_number_of_sponsors - 1, sponsors_signed: true) }

          it "assigns the @signature instance variable" 


          it "assigns the @petition instance variable" 


          it "marks the signature has having seen the confirmation page" 


          it "renders the sponsors/signed template" 

        end
      end
    end
  end
end

