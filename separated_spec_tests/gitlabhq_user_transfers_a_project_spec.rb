require 'spec_helper'

describe 'Projects > Settings > User transfers a project', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository, namespace: user.namespace) }
  let(:group) { create(:group) }

  before do
    group.add_owner(user)
    sign_in(user)
  end

  def transfer_project(project, group)
    visit edit_project_path(project)

    page.within('.js-project-transfer-form') do
      page.find('.select2-container').click
    end

    page.find("div[role='option']", text: group.full_name).click

    click_button('Transfer project')

    fill_in 'confirm_name_input', with: project.name

    click_button 'Confirm'

    wait_for_requests
  end

  it 'allows transferring a project to a group' 


  context 'and a new project is added with the same path' do
    it 'overrides the redirect' 

  end

  context 'when nested groups are available', :nested_groups do
    it 'allows transferring a project to a subgroup' 

  end
end

