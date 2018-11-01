# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Spree::Api::PromotionsController, type: :request do
    shared_examples "a JSON response" do
      it 'should be ok' 


      it 'should return JSON' 

    end

    before do
      stub_authentication!
    end

    let(:promotion) { create :promotion, code: '10off' }

    describe 'GET #show' do
      subject { get spree.api_promotion_path(id) }

      context 'when admin' do
        sign_in_as_admin!

        context 'when finding by id' do
          let(:id) { promotion.id }

          it_behaves_like "a JSON response"
        end

        context 'when finding by code' do
          let(:id) { promotion.codes.first.value }

          it_behaves_like "a JSON response"
        end

        context 'when id does not exist' do
          let(:id) { 'argh' }

          it 'should be 404' 

        end
      end

      context 'when non admin' do
        let(:id) { promotion.id }

        it 'should be unauthorized' 

      end
    end
  end
end

