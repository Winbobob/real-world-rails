# frozen_string_literal: true

require 'rails_helper'

describe My::WorksController, type: :controller do
  include FactoryHelpers
  routes { Sufia::Engine.routes }

  let(:user) { create(:archivist) }

  describe 'logged in user' do
    before do
      allow_any_instance_of(Devise::Strategies::HttpHeaderAuthenticatable).to receive(:remote_user).and_return(user.login)
      allow_any_instance_of(User).to receive(:groups).and_return([])
    end

    describe '#index' do
      let!(:work)       { create(:file, depositor: user.login) }
      let!(:other_work) { create(:file) }
      let(:user_results) do
        ActiveFedora::SolrService.instance.conn.get 'select',
                                                    params: { fq: ["edit_access_group_ssim:public OR edit_access_person_ssim:#{user.user_key}"] }
      end

      context 'with a standard request' do
        before { xhr :get, :index }

        it 'returns an array of documents I can edit' 

      end

      describe 'specifying a collection to add' do
        subject { assigns(:incorporate_collection_presenter) }

        let(:incorporate_collection) { create(:collection) }

        before { get :index, add_files_to_collection: collection }

        context 'when the collection exists' do
          let(:collection) { incorporate_collection.id }

          it { is_expected.to be_kind_of(CollectionPresenter) }
        end

        context 'with a null collection to add' do
          let(:collection) { '' }

          it { is_expected.to be_nil }
        end

        context 'with a non-existent collection to add' do
          let(:collection) { 'idontexist' }

          it { is_expected.to be_nil }
        end
      end
    end

    describe 'term search' do
      let!(:file_set) { build(:file_set, id: 'fs') }
      let!(:work)     { build(:public_work, :with_complete_metadata, members: [file_set], depositor: 'archivist1', id: '1234') }

      let(:file) { mock_file_factory(format_label: ['format_labelformat_label']) }

      before do
        allow(file_set).to receive(:original_file).and_return(file)
        allow(work).to receive(:representative).and_return(file_set)
        ActiveFedora::Cleaner.cleanout_solr
        index_file_set(file_set)
        index_work(work)
      end
      it 'finds a file by title' 

      it 'finds a file by keyword' 

      it 'finds a file by subject' 

      it 'finds a file by creator' 

      it 'finds a file by contributor' 

      it 'finds a file by publisher' 

      it 'finds a file by based_near' 

      it 'finds a file by language' 

      it 'finds a file by resource_type' 

      it 'finds a file by format_label' 

      it 'finds a file by description' 

    end
  end

  describe 'not logged in as a user' do
    describe '#index' do
      it 'returns an error' 

    end
  end
end

