require 'spec_helper'

describe Projects::TemplatesController do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:file_path_1) { '.gitlab/issue_templates/bug.md' }
  let(:body) { JSON.parse(response.body) }

  before do
    project.add_developer(user)
    sign_in(user)
  end

  before do
    project.add_user(user, Gitlab::Access::MASTER)
    project.repository.create_file(user, file_path_1, 'something valid',
      message: 'test 3', branch_name: 'master')
  end

  describe '#show' do
    it 'renders template name and content as json' 


    it 'renders 404 when unauthorized' 


    it 'renders 404 when template type is not found' 


    it 'renders 404 without errors' 

  end
end

