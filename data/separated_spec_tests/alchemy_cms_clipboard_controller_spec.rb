# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Admin::ClipboardController do
    routes { Alchemy::Engine.routes }

    let(:public_page)     { build_stubbed(:alchemy_page, :public) }
    let(:element)         { build_stubbed(:alchemy_element, page: public_page) }
    let(:another_element) { build_stubbed(:alchemy_element, page: public_page) }

    before do
      authorize_user(:as_admin)
      session[:alchemy_clipboard] = {}
    end

    describe '#index' do
      context 'with `remarkable_type` being an allowed type' do
        it 'is successful' 

      end

      context 'with `remarkable_type` not an allowed type' do
        it 'raises 400 Bad Request' 

      end
    end

    context 'for elements' do
      before do
        expect(Element).to receive(:find).and_return(element)
      end

      describe "#insert" do
        it "should hold element ids" 


        it "should not have the same element twice" 

      end

      describe "#delete" do
        it "should remove element ids from clipboard" 

      end
    end

    describe "#clear" do
      context "with elements as remarkable_type" do
        it "should clear the elements clipboard" 

      end

      context "with pages as remarkable_type" do
        it "should clear the pages clipboard" 

      end
    end
  end
end

