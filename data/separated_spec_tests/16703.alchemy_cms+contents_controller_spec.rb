# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Api::ContentsController do
    routes { Alchemy::Engine.routes }

    describe '#index' do
      let!(:page)    { create(:alchemy_page) }
      let!(:element) { create(:alchemy_element, page: page) }
      let!(:content) { create(:alchemy_content, element: element) }

      it "returns all public contents as json objects" 


      context 'with element_id' do
        let!(:other_element) { create(:alchemy_element, page: page) }
        let!(:other_content) { create(:alchemy_content, element: other_element) }

        it "returns only contents from this element" 

      end

      context 'with empty element_id' do
        it "returns all contents" 

      end

      context 'as author' do
        before do
          authorize_user(build(:alchemy_dummy_user, :as_author))
        end

        it "returns all contents" 

      end
    end

    describe '#show' do
      context 'with no other params given' do
        let(:page)    { create(:alchemy_page) }
        let(:element) { create(:alchemy_element, page: page) }
        let(:content) { create(:alchemy_content, element: element) }

        before do
          expect(Content).to receive(:find).and_return(content)
        end

        it "returns content as json" 


        context 'requesting an restricted content' do
          let(:page) { create(:alchemy_page, restricted: true) }

          it "responds with 403" 

        end
      end

      context 'with element_id and name params given' do
        let!(:page)    { create(:alchemy_page) }
        let!(:element) { create(:alchemy_element, page: page) }
        let!(:content) { create(:alchemy_content, element: element) }

        it 'returns the named content from element with given id.' 

      end

      context 'with empty element_id or name param' do
        it 'returns 404 error.' 

      end
    end
  end
end

