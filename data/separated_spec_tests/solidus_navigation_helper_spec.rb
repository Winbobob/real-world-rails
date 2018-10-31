# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::NavigationHelper, type: :helper do
  describe "#tab" do
    context "creating an admin tab" do
      it "should capitalize the first letter of each word in the tab's label" 

    end

    describe "selection" do
      context "when match_path option is not supplied" do
        subject(:tab) { helper.tab(:orders) }

        it "should be selected if the controller matches" 


        it "should not be selected if the controller does not match" 


        it "should be selected if the current path" 


        it "should not be selected if not current path" 

      end

      context "when match_path option is supplied" do
        before do
          allow(helper).to receive(:request).and_return(double(ActionDispatch::Request, fullpath: "/admin/orders/edit/1"))
        end

        it "should be selected if the fullpath matches" 


        it "should be selected if the fullpath matches a regular expression" 


        it "should not be selected if the fullpath does not match" 


        it "should not be selected if the fullpath does not match a regular expression" 

      end
    end

    it "should accept a block of content to append" 

  end

  describe "#link_to_delete" do
    let!(:item) { create(:stock_item) }
    let(:options) { {} }
    let(:link) { subject }

    subject { helper.link_to_delete(item, options) }

    # object_url is provided by the ResourceController abstract controller.
    # as we cannot set a custom controller for helper tests, we need to fake it
    before do
      allow(helper).to receive(:object_url) do |o|
        "/stock_items/#{o.to_param}"
      end
    end

    it "generates a deletion link for the resource" 


    it "allows customization of the url" 


    it "allows customization of the link name" 


    it "allows customization of the confirmation message" 

  end

  describe "#solidus_icon" do
    context "if given an icon_name" do
      subject(:solidus_icon) { helper.solidus_icon('example-icon-name') }

      it { is_expected.to eq "<i class=\"example-icon-name\"></i>" }
    end

    context "if not given nil icon_name" do
      subject(:solidus_icon) { helper.solidus_icon(nil) }

      it { is_expected.to eq "" }
    end
  end

  describe "#icon" do
    subject(:icon) { helper.icon('icon-name') }

    it "is a deprecated way to use #solidus_icon" 

  end
end

