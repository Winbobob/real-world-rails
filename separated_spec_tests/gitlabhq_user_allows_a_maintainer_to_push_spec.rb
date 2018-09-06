require 'spec_helper'

describe 'create a merge request that allows maintainers to push', :js do
  include ProjectForksHelper
  let(:user) { create(:user) }
  let(:target_project) { create(:project, :public, :repository) }
  let(:source_project) { fork_project(target_project, user, repository: true, namespace: user.namespace) }

  def visit_new_merge_request
    visit project_new_merge_request_path(
      source_project,
      merge_request: {
        source_project_id: source_project.id,
        target_project_id: target_project.id,
        source_branch: 'fix',
        target_branch: 'master'
      })
  end

  before do
    sign_in(user)
  end

  it 'allows setting maintainer push possible' 


  it 'shows a message when one of the projects is private' 


  it 'shows a message when the source branch is protected' 


  context 'when the merge request is being created within the same project' do
    let(:source_project) { target_project }

    it 'hides the checkbox if the merge request is being created within the same project' 

  end

  context 'when a maintainer tries to edit the option' do
    let(:maintainer) { create(:user) }
    let(:merge_request) do
      create(:merge_request,
             source_project: source_project,
             target_project: target_project,
             source_branch: 'fixes')
    end

    before do
      target_project.add_master(maintainer)

      sign_in(maintainer)
    end

    it 'it hides the option from maintainers' 

  end
end

