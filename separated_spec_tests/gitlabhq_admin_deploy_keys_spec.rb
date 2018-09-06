require 'spec_helper'

RSpec.describe 'admin deploy keys' do
  let!(:deploy_key) { create(:deploy_key, public: true) }
  let!(:another_deploy_key) { create(:another_deploy_key, public: true) }

  before do
    sign_in(create(:admin))
  end

  it 'show all public deploy keys' 


  it 'shows all the projects the deploy key has write access' 


  describe 'create a new deploy key' do
    let(:new_ssh_key) { attributes_for(:key)[:key] }

    before do
      visit admin_deploy_keys_path
      click_link 'New deploy key'
    end

    it 'creates a new deploy key' 

  end

  describe 'update an existing deploy key' do
    before do
      visit admin_deploy_keys_path
      find('tr', text: deploy_key.title).click_link('Edit')
    end

    it 'updates an existing deploy key' 

  end

  describe 'remove an existing deploy key' do
    before do
      visit admin_deploy_keys_path
    end

    it 'removes an existing deploy key' 

  end
end

