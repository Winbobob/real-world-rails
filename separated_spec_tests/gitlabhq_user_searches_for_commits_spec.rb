require 'spec_helper'

describe 'User searches for commits' do
  let(:project) { create(:project, :repository) }
  let(:sha) { '6d394385cf567f80a8fd85055db1ab4c5295806f' }
  let(:user) { create(:user) }

  before do
    project.add_reporter(user)
    sign_in(user)

    visit(search_path(project_id: project.id))
  end

  context 'when searching by SHA' do
    it 'finds a commit and redirects to its page' 


    it 'finds a commit in uppercase and redirects to its page' 

  end

  context 'when searching by message' do
    it 'finds a commit and holds on /search page' 


    it 'finds multiple commits' 

  end
end

