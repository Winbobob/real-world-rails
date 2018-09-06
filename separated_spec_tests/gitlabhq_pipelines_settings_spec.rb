require 'spec_helper'

describe "Projects > Settings > Pipelines settings" do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:role) { :developer }

  before do
    sign_in(user)
    project.add_role(user, role)
    create(:project_auto_devops, project: project)
  end

  context 'for developer' do
    let(:role) { :developer }

    it 'to be disallowed to view' 

  end

  context 'for master' do
    let(:role) { :master }

    it 'be allowed to change' 


    it 'updates auto_cancel_pending_pipelines' 


    describe 'Auto DevOps' do
      it 'update auto devops settings' 

    end
  end
end

