require 'spec_helper'

describe 'Project deploy keys', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project_empty_repo) }

  before do
    project.add_master(user)
    sign_in(user)
  end

  describe 'removing key' do
    before do
      create(:deploy_keys_project, project: project)
    end

    it 'removes association between project and deploy key' 

  end
end

