require 'spec_helper'

describe 'Projects > Settings > Repository settings' do
  let(:project) { create(:project_empty_repo) }
  let(:user) { create(:user) }
  let(:role) { :developer }

  before do
    project.add_role(user, role)
    sign_in(user)
  end

  context 'for developer' do
    let(:role) { :developer }

    it 'is not allowed to view' 

  end

  context 'for master' do
    let(:role) { :master }

    context 'Deploy Keys', :js do
      let(:private_deploy_key) { create(:deploy_key, title: 'private_deploy_key', public: false) }
      let(:public_deploy_key) { create(:another_deploy_key, title: 'public_deploy_key', public: true) }
      let(:new_ssh_key) { attributes_for(:key)[:key] }

      it 'get list of keys' 


      it 'add a new deploy key' 


      it 'edit an existing deploy key' 


      it 'edit a deploy key from projects user has access to' 


      it 'remove an existing deploy key' 

    end

    context 'Deploy tokens' do
      let!(:deploy_token) { create(:deploy_token, projects: [project]) }

      before do
        stub_container_registry_config(enabled: true)
        visit project_settings_repository_path(project)
      end

      scenario 'view deploy tokens' do
        within('.deploy-tokens') do
          expect(page).to have_content(deploy_token.name)
          expect(page).to have_content('read_repository')
          expect(page).to have_content('read_registry')
        end
      end

      scenario 'add a new deploy token' do
        fill_in 'deploy_token_name', with: 'new_deploy_key'
        fill_in 'deploy_token_expires_at', with: (Date.today + 1.month).to_s
        check 'deploy_token_read_repository'
        check 'deploy_token_read_registry'
        click_button 'Create deploy token'

        expect(page).to have_content('Your new project deploy token has been created')
      end
    end

    context 'remote mirror settings' do
      let(:user2) { create(:user) }

      before do
        project.add_master(user2)

        visit project_settings_repository_path(project)
      end

      it 'shows push mirror settings' 

    end
  end
end

