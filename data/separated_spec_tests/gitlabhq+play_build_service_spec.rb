require 'spec_helper'

describe Ci::PlayBuildService, '#execute' do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:pipeline) { create(:ci_pipeline, project: project) }
  let(:build) { create(:ci_build, :manual, pipeline: pipeline) }

  let(:service) do
    described_class.new(project, user)
  end

  context 'when project does not have repository yet' do
    let(:project) { create(:project) }

    it 'allows user to play build if protected branch rules are met' 


    it 'does not allow user with developer role to play build' 

  end

  context 'when project has repository' do
    let(:project) { create(:project, :repository) }

    it 'allows user with developer role to play a build' 

  end

  context 'when build is a playable manual action' do
    let(:build) { create(:ci_build, :manual, pipeline: pipeline) }

    before do
      project.add_developer(user)

      create(:protected_branch, :developers_can_merge,
             name: build.ref, project: project)
    end

    it 'enqueues the build' 


    it 'reassignes build user correctly' 

  end

  context 'when build is not a playable manual action' do
    let(:build) { create(:ci_build, when: :manual, pipeline: pipeline) }

    before do
      project.add_developer(user)

      create(:protected_branch, :developers_can_merge,
             name: build.ref, project: project)
    end

    it 'duplicates the build' 


    it 'assigns users correctly' 

  end

  context 'when build is not action' do
    let(:build) { create(:ci_build, :success, pipeline: pipeline) }

    it 'raises an error' 

  end

  context 'when user does not have ability to trigger action' do
    before do
      create(:protected_branch, :no_one_can_push,
             name: build.ref, project: project)
    end

    it 'raises an error' 

  end
end

