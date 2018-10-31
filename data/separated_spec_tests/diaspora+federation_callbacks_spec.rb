# frozen_string_literal: true

require "diaspora_federation/test"

describe "diaspora federation callbacks" do
  describe ":fetch_person_for_webfinger" do
    it "returns a WebFinger instance with the data from the person" 


    it "contains the OpenID issuer" 


    it "returns nil if the person was not found" 


    it "returns nil for a remote person" 


    it "returns nil for a closed account" 

  end

  describe ":fetch_person_for_hcard" do
    it "returns a HCard instance with the data from the person" 


    it "trims the full_name" 


    it "returns nil if the person was not found" 


    it "returns nil for a remote person" 


    it "returns nil for a closed account" 

  end

  describe ":save_person_after_webfinger" do
    context "new person" do
      it "creates a new person" 


      it "creates a new person with images" 


      it "raises an error if a person with the same GUID already exists" 

    end

    context "update profile" do
      let(:existing_person_entity) { FactoryGirl.create(:person) }
      let(:person) {
        DiasporaFederation::Entities::Person.new(
          FactoryGirl.attributes_for(:federation_person_from_webfinger,
                                     diaspora_id: existing_person_entity.diaspora_handle)
        )
      }

      it "updates an existing profile" 


      it "should not change the existing person" 


      it "creates profile for existing person if no profile present" 

    end
  end

  let(:local_person) { FactoryGirl.create(:user).person }
  let(:remote_person) { FactoryGirl.create(:person) }

  describe ":fetch_private_key" do
    it "returns a private key for a local user" 


    it "returns nil for a remote user" 


    it "returns nil for an unknown id" 

  end

  describe ":fetch_public_key" do
    it "returns a public key for a person" 


    it "fetches an unknown user" 


    it "forwards the DiscoveryError when the person can't be fetched" 

  end

  describe ":fetch_related_entity" do
    it "returns related entity for an existing local post" 


    it "returns related entity for an existing remote post" 


    it "returns related entity for an existing public post" 


    it "returns related entity for an existing comment" 


    it "returns related entity for an existing conversation" 


    it "returns related entity for an existing person" 


    it "returns nil for a non-existing guid" 

  end

  describe ":queue_public_receive" do
    it "enqueues a ReceivePublic job" 

  end

  describe ":queue_private_receive" do
    let(:data) { "<diaspora/>" }

    it "returns true if the user is found" 


    it "enqueues a ReceivePrivate job" 


    it "returns false if the no user is found" 


    it "returns false if the no person is found" 

  end

  describe ":receive_entity" do
    it "receives an AccountDeletion" 


    it "receives a Retraction" 


    it "receives a entity" 


    it "calls schedule_check_if_needed on the senders pod" 


    it "receives a entity for a recipient" 


    it "does not trigger a ReceiveLocal job if Receive.perform returned nil" 

  end

  describe ":fetch_public_entity" do
    it "fetches a Post" 


    it "fetches a StatusMessage" 


    it "fetches a Reshare" 


    it "fetches a StatusMessage by a Poll guid" 


    it "doesn't fetch a private StatusMessage by a Poll guid" 


    it "does not fetch a private post" 


    it "returns nil, if the post is unknown" 

  end

  describe ":fetch_person_url_to" do
    it "returns the url with with the pod of the person" 


    it "fetches an unknown user" 


    it "forwards the DiscoveryError" 

  end

  describe ":update_pod" do
    let(:pod) { FactoryGirl.create(:pod) }
    let(:pod_url) { pod.url_to("/") }

    it "sets the correct error for curl-errors" 


    it "sets :no_errors to a pod that was down but up now and return code 202" 


    it "does not change a pod that has status :version_failed and was successful" 


    it "sets :http_failed if it has an unsuccessful http status code" 

  end
end

