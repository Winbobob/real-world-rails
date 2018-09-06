# frozen_string_literal: true

require 'rails_helper'

describe CurationConcerns::GenericWorksController, type: :controller do
  let(:user) { create(:user) }

  describe '#show' do
    context 'with a public user' do
      let(:work) { create(:public_work) }

      it 'loads from solr' 

    end

    context "when the work doesn't exist" do
      it 'throws 500 error' 

    end

    context 'when work is registered' do
      let(:work)   { create(:registered_file) }
      let(:path)   { Rails.application.routes.url_helpers.curation_concerns_generic_work_path(work) }

      it 'redirects with file in url' 

    end
  end

  describe '#delete' do
    before do
      allow_any_instance_of(Devise::Strategies::HttpHeaderAuthenticatable).to receive(:remote_user).and_return(user.login)
      allow_any_instance_of(User).to receive(:groups).and_return([])
    end

    context 'when the work has been pushed to Share' do
      let!(:work) { create(:share_file, depositor: user.login) }

      it 'is deleted from SHARE notify' 

    end

    context 'after deletion' do
      let!(:work) { create(:work, depositor: user.login) }

      it 'redirects to My Works' 

    end
  end

  describe '#edit' do
    before do
      allow_any_instance_of(Devise::Strategies::HttpHeaderAuthenticatable).to receive(:remote_user).and_return(user.login)
      allow_any_instance_of(User).to receive(:groups).and_return([])
    end

    context 'when files are being uploaded to a work' do
      let!(:work) { create(:work, depositor: user.login) }

      before { allow(QueuedFile).to receive(:where).and_return(['queued file']) }

      it 'redirects' 

    end
  end

  describe '#update' do
    before do
      allow_any_instance_of(Devise::Strategies::HttpHeaderAuthenticatable).to receive(:remote_user).and_return(user.login)
      allow_any_instance_of(User).to receive(:groups).and_return([])
    end

    let!(:work) { create(:work, depositor: user.login) }
    let(:doi_service) { instance_double(DOIService, run: 'doi:sholder/abc123') }

    it 'allows updates' 


    context 'replacing with a bad creator' do
      let(:creators) { { '1' => { 'id' => '', 'given_name' => 'sdfsdf', 'sur_name' => '', 'display_name' => '', 'email' => '', 'psu_id' => '', 'orcid_id' => '' } } }

      it 'fails to update' 

    end

    it 'creates doi on update' 

  end

  describe '#create' do
    before do
      allow_any_instance_of(Devise::Strategies::HttpHeaderAuthenticatable).to receive(:remote_user).and_return(user.login)
      allow_any_instance_of(User).to receive(:groups).and_return([])
      initialize_default_adminset
      post :create, generic_work: work.attributes.merge('creators' => creators)
    end

    let(:creators) { { '1' => { 'id' => '', 'given_name' => 'Kermit', 'sur_name' => 'The Frog', 'display_name' => 'Kermit the little green Frog', 'email' => '', 'psu_id' => '', 'orcid_id' => '' } } }
    let(:work) { build(:work, depositor: user.login) }

    it 'allows creates' 


    context 'replacing with a bad creator' do
      let(:creators) { { '1' => { 'id' => '', 'given_name' => 'sdfsdf', 'sur_name' => '', 'display_name' => '', 'email' => '', 'psu_id' => '', 'orcid_id' => '' } } }

      it 'fails to create' 

    end
  end

  context 'when work is private' do
    let(:work) { create(:private_work, id: '1234') }

    before { sign_in user }

    context 'when user is not administrator' do
      let(:user) { FactoryGirl.create(:user) }

      it 'does not allow any user to view' 


      it 'does not allow any user to edit' 


      it 'does not allow any user to update' 

    end

    context 'when user is an administrator' do
      let(:user) { FactoryGirl.create(:administrator) }

      it 'does allow user to view' 


      it 'allows edits and migrates creators' 


      it 'allows updates' 

    end
  end
end

