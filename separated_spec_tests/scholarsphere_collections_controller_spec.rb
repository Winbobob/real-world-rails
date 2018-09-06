# frozen_string_literal: true

require 'rails_helper'

describe CollectionsController, type: :controller do
  subject { response }

  let(:user) { create(:user) }

  before do
    allow_any_instance_of(Devise::Strategies::HttpHeaderAuthenticatable).to receive(:remote_user).and_return(user.login)
    allow_any_instance_of(User).to receive(:groups).and_return([])
  end

  context "when the Collection doesn't exist" do
    before { get :show, id: 'non-existent-collection' }
    its(:status) { is_expected.to eq(302) }
  end

  context 'when requesting a legacy URL' do
    before { get :show, id: 'scholarsphere:123' }
    its(:status) { is_expected.to eq(301) }
    its(:location) { is_expected.to eq('http://test.host/collections/123') }
  end

  context 'when requesting an existing collection' do
    let(:work1)       { create(:public_work) }
    let(:work2)       { create(:public_work) }
    let!(:collection) { create(:public_collection, members: [work1, work2]) }

    before { get :show, id: collection.id, per_page: 1, page: 2 }
    it { is_expected.to be_success }
  end

  context 'when editing an existing collection' do
    let(:work1)       { create(:public_work, depositor: user.login) }
    let(:work2)       { create(:public_work, depositor: user.login) }
    let!(:collection) { create(:public_collection, members: [work1, work2], depositor: user.login) }

    it 'runs the migration' 

  end

  describe '::form_class' do
    subject { described_class }

    its(:form_class) { is_expected.to be(CollectionForm) }
  end

  describe '#delete' do
    let(:collection) { create(:collection, depositor: user.login) }

    context 'when the collection is successfully deleted' do
      before { delete :destroy, id: collection }
      it { is_expected.to redirect_to('/dashboard/collections') }
    end

    context 'when the collection is not successfully deleted' do
      before do
        controller.instance_variable_set(:@collection, collection)
        allow(collection).to receive(:destroy).and_return(false)
        delete :destroy, id: collection
      end
      it { is_expected.to redirect_to('/dashboard/collections') }
    end
  end

  describe '#create' do
    let(:collection) { assigns[:collection] }
    let(:permissions) { collection.permissions.map(&:to_hash) }

    it 'applies the persmissions' 


    context 'when doi is requested' do
      let(:doi_service) { instance_double(DOIService, run: 'doi:sholder/abc123') }

      it 'applies the persmissions' 

    end
  end

  describe '#update' do
    let(:collection)  { create :collection, depositor: user.login }
    let(:doi_service) { instance_double(DOIService, run: 'doi:sholder/abc123') }

    it 'applies the persmissions' 

  end
end

