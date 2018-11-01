# frozen_string_literal: true

RSpec.describe Bundler::URICredentialsFilter do
  subject { described_class }

  describe "#credential_filtered_uri" do
    shared_examples_for "original type of uri is maintained" do
      it "maintains same type for return value as uri input type" 

    end

    shared_examples_for "sensitive credentials in uri are filtered out" do
      context "authentication using oauth credentials" do
        context "specified via 'x-oauth-basic'" do
          let(:credentials) { "oauth_token:x-oauth-basic@" }

          it "returns the uri without the oauth token" 


          it_behaves_like "original type of uri is maintained"
        end

        context "specified via 'x'" do
          let(:credentials) { "oauth_token:x@" }

          it "returns the uri without the oauth token" 


          it_behaves_like "original type of uri is maintained"
        end
      end

      context "authentication using login credentials" do
        let(:credentials) { "username1:hunter3@" }

        it "returns the uri without the password" 


        it_behaves_like "original type of uri is maintained"
      end

      context "authentication without credentials" do
        let(:credentials) { "" }

        it "returns the same uri" 


        it_behaves_like "original type of uri is maintained"
      end
    end

    context "uri is a uri object" do
      let(:uri) { URI("https://#{credentials}github.com/company/private-repo") }

      it_behaves_like "sensitive credentials in uri are filtered out"
    end

    context "uri is a uri string" do
      let(:uri) { "https://#{credentials}github.com/company/private-repo" }

      it_behaves_like "sensitive credentials in uri are filtered out"
    end

    context "uri is a non-uri format string (ex. path)" do
      let(:uri) { "/path/to/repo" }

      it "returns the same uri" 


      it_behaves_like "original type of uri is maintained"
    end

    context "uri is nil" do
      let(:uri) { nil }

      it "returns nil" 


      it_behaves_like "original type of uri is maintained"
    end
  end

  describe "#credential_filtered_string" do
    let(:str_to_filter) { "This is a git message containing a uri #{uri}!" }
    let(:credentials)   { "" }
    let(:uri)           { URI("https://#{credentials}github.com/company/private-repo") }

    context "with a uri that contains credentials" do
      let(:credentials) { "oauth_token:x-oauth-basic@" }

      it "returns the string without the sensitive credentials" 

    end

    context "that does not contains credentials" do
      it "returns the same string" 

    end

    context "string to filter is nil" do
      let(:str_to_filter) { nil }

      it "returns nil" 

    end

    context "uri to filter out is nil" do
      let(:uri) { nil }

      it "returns the same string" 

    end
  end
end

