require 'spec_helper'

describe 'Projects > Settings > For a forked project', :js do
  include ProjectForksHelper
  let(:user) { create(:user) }
  let(:original_project) { create(:project) }
  let(:forked_project) { fork_project(original_project, user) }

  before do
    original_project.add_master(user)
    forked_project.add_master(user)
    sign_in(user)
  end

  shared_examples 'project settings for a forked projects' do
    it 'allows deleting the link to the forked project' 

  end

  it_behaves_like 'project settings for a forked projects'

  context 'when the original project is deleted' do
    before do
      original_project.destroy!
    end

    it_behaves_like 'project settings for a forked projects'
  end
end

