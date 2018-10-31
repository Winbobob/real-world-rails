# frozen_string_literal: true
require 'rails_helper'

describe ShareProgressVariantBuilder do
  let(:params) { { title: 'foo', description: 'bar' } }

  let(:sp_variants) { [{ id: 123 }] }

  let!(:page) { create(:page) }

  let(:success_sp_button) do
    double(:button,
           save: true,
           button_template: 'sp_fb_large',
           id: '1',
           share_button_html: '<div />',
           page_url: 'http://example.com/foo',
           variants: { facebook: sp_variants })
  end

  let(:failure_sp_button) do
    double(:button,
           save: false,
           errors: { 'variants' => [['email_body needs {LINK}']] })
  end

  describe '.update_button_url' do
    let(:button) { create(:share_button, :facebook) }
    let(:sp_button) { double(:ShareProgressButton, save: true) }

    before do
      allow(ShareProgress::Button).to receive(:new) { sp_button }
      ShareProgressVariantBuilder.update_button_url('http://example.com', button)
    end

    it 'saves button on ShareProgress' 


    it 'updates button URL' 

  end

  describe '.create' do
    subject(:create_variant) do
      ShareProgressVariantBuilder.create(
        params: params,
        variant_type: 'facebook',
        page: page,
        url: 'http://example.com/foo'
      )
    end

    describe 'success' do
      before do
        allow(ShareProgress::Button).to receive(:new) { success_sp_button }
      end

      it 'creates a share progress variant' 


      it 'creates a variant that is associated with a button' 


      it 'persists variant locally' 


      it 'persists button locally' 


      it 'uses URL from previous' 

    end

    describe 'failure' do
      before do
        allow(ShareProgress::Button).to receive(:new) { failure_sp_button }
      end

      it 'does not persist variant locally' 


      it 'does not persist button locally' 


      it 'adds the errors to the variant' 

    end

    describe 'reporting unexpected error messages' do
      before do
        allow(ShareProgress::Button).to receive(:new) { failure_sp_button }
      end

      it 'reports with a string error' 


      it 'reports with an array error' 


      it 'reports with a singly nested error' 


      it 'reports with an unnested error' 


      it 'reports with an unknown key' 

    end
  end

  describe '.update' do
    let!(:share) { create(:share_facebook, title: 'Foo') }
    let!(:button) { create(:share_button, sp_type: 'facebook', page: page, sp_id: 23) }
    let(:params) { { title: 'Bar' } }

    subject(:update_variant) do
      ShareProgressVariantBuilder.update(
        params: params,
        variant_type: 'facebook',
        page: page,
        id: share.id
      )
    end

    describe 'success' do
      before do
        allow(ShareProgress::Button).to receive(:new) { success_sp_button }
      end

      it 'updates variant' 


      it 'updates variant on share progress' 


      it 'does not request to SP API if nothing changed' 

    end

    describe 'failure' do
      before do
        allow(ShareProgress::Button).to receive(:new) { failure_sp_button }
      end

      it 'does not update variant locally' 


      it 'adds the errors to the variant' 

    end
  end

  context '.destroy' do
    subject(:destroy_variant) do
      ShareProgressVariantBuilder.destroy(
        params: params,
        variant_type: 'facebook',
        page: page,
        id: share.id
      )
    end

    describe 'success' do
      let!(:button) { create(:share_button, sp_type: 'facebook', page: page, sp_id: 24) }
      let!(:share) { create(:share_facebook, title: 'herpaderp', sp_id: 24) }
      let(:params) { { title: 'Bar' } }

      before do
        allow(ShareProgress::Button).to receive(:new) { success_sp_button }
      end

      it 'returns an object with no errors' 


      it 'removes the variant from local storage' 

    end

    describe 'failure' do
      let!(:button) { create(:share_button, sp_type: 'facebook', page: page, sp_id: nil) }
      let!(:share) { create(:share_facebook, title: 'herpaderp', sp_id: nil) }
      let(:params) { { title: 'Bar' } }

      before do
        allow(ShareProgress::Button).to receive(:new) { success_sp_button }
      end

      it 'returns errors from ShareProgress' 


      it 'does not remove the variant from local storage' 

    end
  end
end

