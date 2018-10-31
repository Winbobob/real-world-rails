require 'spec_helper'

describe Gitlab::CycleAnalytics::Permissions do
  let(:project) { create(:project, public_builds: false) }
  let(:user) { create(:user) }

  subject { described_class.get(user: user, project: project) }

  context 'user with no relation to the project' do
    it 'has no permissions to issue stage' 


    it 'has no permissions to test stage' 


    it 'has no permissions to staging stage' 


    it 'has no permissions to production stage' 


    it 'has no permissions to code stage' 


    it 'has no permissions to review stage' 


    it 'has no permissions to plan stage' 

  end

  context 'user is master' do
    before do
      project.add_master(user)
    end

    it 'has permissions to issue stage' 


    it 'has permissions to test stage' 


    it 'has permissions to staging stage' 


    it 'has permissions to production stage' 


    it 'has permissions to code stage' 


    it 'has permissions to review stage' 


    it 'has permissions to plan stage' 

  end

  context 'user has no build permissions' do
    before do
      project.add_guest(user)
    end

    it 'has permissions to issue stage' 


    it 'has no permissions to test stage' 


    it 'has no permissions to staging stage' 

  end

  context 'user has no merge request permissions' do
    before do
      project.add_guest(user)
    end

    it 'has permissions to issue stage' 


    it 'has no permissions to code stage' 


    it 'has no permissions to review stage' 

  end

  context 'user has no issue permissions' do
    before do
      project.add_developer(user)
      project.project_feature.update_attribute(:issues_access_level, ProjectFeature::DISABLED)
    end

    it 'has permissions to code stage' 


    it 'has no permissions to issue stage' 


    it 'has no permissions to production stage' 

  end
end

