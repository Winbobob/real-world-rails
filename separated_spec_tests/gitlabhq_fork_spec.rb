require 'spec_helper'

describe 'Project fork' do
  include ProjectForksHelper

  let(:user) { create(:user) }
  let(:project) { create(:project, :public, :repository) }

  before do
    sign_in user
  end

  it 'allows user to fork project' 


  it 'disables fork button when user has exceeded project limit' 


  it 'forks the project' 


  it 'shows the forked project on the list' 


  context 'when the project is private' do
    let(:project) { create(:project, :repository) }
    let(:another_user) { create(:user, name: 'Mike') }

    before do
      project.add_reporter(user)
      project.add_reporter(another_user)
    end

    it 'renders private forks of the project' 

  end

  context 'when the user already forked the project' do
    before do
      create(:project, :repository, name: project.name, namespace: user.namespace)
    end

    it 'renders error' 

  end

  context 'master in group' do
    let(:group) { create(:group) }

    before do
      group.add_master(user)
    end

    it 'allows user to fork project to group or to user namespace' 


    it 'allows user to fork project to group and not user when exceeded project limit' 


    it 'links to the fork if the project was already forked within that namespace' 

  end
end

