require 'spec_helper'

describe 'Admin::Hooks' do
  let(:user) { create(:admin) }

  before do
    sign_in(user)
  end

  describe 'GET /admin/hooks' do
    it 'is ok' 


    it 'has hooks list' 


    it 'renders plugins list as well' 

  end

  describe 'New Hook' do
    let(:url) { generate(:url) }

    it 'adds new hook' 

  end

  describe 'Update existing hook' do
    let(:new_url) { generate(:url) }

    before do
      create(:system_hook)
    end

    it 'updates existing hook' 

  end

  describe 'Remove existing hook', :js do
    before do
      create(:system_hook)
    end

    context 'removes existing hook' do
      it 'from hooks list page' 


      it 'from hook edit page' 

    end
  end

  describe 'Test', :js do
    before do
      system_hook = create(:system_hook)
      WebMock.stub_request(:post, system_hook.url)
      visit admin_hooks_path

      find('.hook-test-button.dropdown').click
      click_link 'Push events'
    end

    it { expect(current_path).to eq(admin_hooks_path) }
  end

  context 'Merge request hook' do
    describe 'New Hook' do
      let(:url) { generate(:url) }

      it 'adds new hook' 

    end

    describe 'Test', :js do
      before do
        system_hook = create(:system_hook)
        WebMock.stub_request(:post, system_hook.url)
      end

      it 'succeeds if the user has a repository with a merge request' 

    end
  end
end

