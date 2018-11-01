require 'spec_helper'

describe Ci::RunScheduledBuildService do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:pipeline) { create(:ci_pipeline, project: project) }

  subject { described_class.new(project, user).execute(build) }

  before do
    stub_feature_flags(ci_enable_scheduled_build: true)
  end

  context 'when user can update build' do
    before do
      project.add_developer(user)

      create(:protected_branch, :developers_can_merge,
             name: pipeline.ref, project: project)
    end

    context 'when build is scheduled' do
      context 'when scheduled_at is expired' do
        let(:build) { create(:ci_build, :expired_scheduled, user: user, project: project, pipeline: pipeline) }

        it 'can run the build' 

      end

      context 'when scheduled_at is not expired' do
        let(:build) { create(:ci_build, :scheduled, user: user, project: project, pipeline: pipeline) }

        it 'can not run the build' 

      end
    end

    context 'when build is not scheduled' do
      let(:build) { create(:ci_build, :created, user: user, project: project, pipeline: pipeline) }

      it 'can not run the build' 

    end
  end

  context 'when user can not update build' do
    context 'when build is scheduled' do
      let(:build) { create(:ci_build, :scheduled, user: user, project: project, pipeline: pipeline) }

      it 'can not run the build' 

    end
  end
end

