# frozen_string_literal: true

require 'feature_spec_helper'

include Selectors::Dashboard

describe Collection, type: :feature do
  let(:current_user) { create(:user, display_name: 'Jill User') }
  let(:title)        { 'Test Collection Title' }
  let(:subtitle)     { 'Machu Picchu' }

  before { sign_in_with_js(current_user) }

  describe 'creating a new collection from the dashboard' do
    it 'displays the new collection page' 

  end

  describe 'creating new collections' do
    before do
      visit(new_collection_path)
      fill_in 'Title', with: title
      fill_in 'Subtitle', with: subtitle
      fill_in 'Description', with: 'description'
      fill_in 'Keyword', with: 'keyword'
    end

    context 'without any files' do
      let(:doi)      { 'doi:abc123' }
      let(:client)   { instance_double(Ezid::Client) }
      let(:response) { instance_double(Ezid::MintIdentifierResponse, id: doi) }

      before do
        allow(Ezid::Client).to receive(:new).and_return(client)
        allow(client).to receive(:mint_identifier).and_return(response)
      end

      it 'creates an empty collection' 

    end

    context 'when adding existing works' do
      let!(:file1) { create(:file, title: ['First file'], depositor: current_user.login) }
      let!(:file2) { create(:file, title: ['Second file'], depositor: current_user.login) }

      it 'adds existing works after the collection is created' 

    end

    context 'when adding new works' do
      it 'creates new works after the collection is created' 

    end
  end

  describe 'selecting files from the dashboard' do
    let!(:file1) { create(:file, title: ['First file'], depositor: current_user.login) }
    let!(:file2) { create(:file, title: ['Second file'], depositor: current_user.login) }

    it 'creates a new collection using the selected files' 

  end
end

