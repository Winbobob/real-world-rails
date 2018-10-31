# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Api::ElementsController do
    routes { Alchemy::Engine.routes }

    describe '#index' do
      let(:page) { create(:alchemy_page, :public) }

      before do
        2.times { create(:alchemy_element, page: page) }
        create(:alchemy_element, :nested, page: page)
      end

      it "returns all public not nested elements as json objects" 


      context 'with page_id param' do
        let!(:other_page)    { create(:alchemy_page, :public) }
        let!(:other_element) { create(:alchemy_element, page: other_page) }

        it "returns only elements from this page" 

      end

      context 'with empty page_id param' do
        it "returns all not nested elements" 

      end

      context 'with named param' do
        let!(:other_element) { create(:alchemy_element, page: page, name: 'news') }

        it "returns only elements named like this." 

      end

      context 'with empty named param' do
        it "returns all not nested elements" 

      end

      context 'as author' do
        before do
          authorize_user(build(:alchemy_dummy_user, :as_author))
        end

        it "returns all not nested elements" 

      end
    end

    describe '#show' do
      let(:page)    { build_stubbed(:alchemy_page) }
      let(:element) { build_stubbed(:alchemy_element, page: page, position: 1) }

      before do
        expect(Element).to receive(:find).and_return(element)
      end

      it "returns element as json" 


      context 'requesting an restricted element' do
        let(:page) { build_stubbed(:alchemy_page, restricted: true) }

        it "responds with 403" 

      end
    end
  end
end

