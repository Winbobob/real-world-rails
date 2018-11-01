require 'spec_helper'

describe Spree::Admin::BaseController, type: :controller do
  controller(Spree::Admin::BaseController) do
    def index
      before_filter :unauthorized
      render text: ""
    end
  end

  it "redirects to Angular login" 


  describe "displaying error messages for active distributors not ready for checkout" do
    it "generates an error message when there is one distributor" 


    it "generates an error message when there are several distributors" 

  end

  describe "rendering as json ActiveModelSerializer" do
    context "when data is an object" do
      let(:data) { { attr: 'value' } }

      context "when an ams prefix is passed" do
        let(:prefix) { "prefix" }

        it "passes a prefix to the serializer method and renders with serializer" 

      end

      context "when no ams prefix is passed" do
        let(:prefix) { "prefix" }

        it "does not pass a prefix to the serializer method and renders with serializer" 

      end
    end

    context "when data is an array" do
      let(:data) { [{ attr: 'value' }] }

      context "when an ams prefix is passed" do
        let(:prefix) { "prefix" }

        it "passes a prefix to the serializer method and renders with each_serializer" 

      end

      context "when no ams prefix is passed" do
        let(:prefix) { "prefix" }

        it "does not pass a prefix to the serializer method and renders with each_serializer" 

      end
    end
  end

  describe "determining the name of the serializer to be used" do
    before do
      class Api::Admin::AllowedPrefixBaseSerializer;end;
      class Api::Admin::BaseSerializer;end;
      allow(controller).to receive(:ams_prefix_whitelist) { [:allowed_prefix] }
    end

    context "when a prefix is passed in" do
      context "and the prefix appears in the whitelist" do
        it "returns the requested serializer" 

      end

      context "and the prefix does not appear in the whitelist" do
        it "raises an error" 

      end
    end

    context "when no prefix is passed in" do
      it "returns the default serializer" 

    end
  end
end

