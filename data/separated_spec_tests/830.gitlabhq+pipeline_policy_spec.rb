require 'spec_helper'

describe Ci::PipelinePolicy, :models do
  let(:user) { create(:user) }
  let(:pipeline) { create(:ci_empty_pipeline, project: project) }

  let(:policy) do
    described_class.new(user, pipeline)
  end

  describe 'rules' do
    describe 'rules for protected ref' do
      let(:project) { create(:project, :repository) }

      before do
        project.add_developer(user)
      end

      context 'when no one can push or merge to the branch' do
        before do
          create(:protected_branch, :no_one_can_push,
                 name: pipeline.ref, project: project)
        end

        it 'does not include ability to update pipeline' 

      end

      context 'when developers can push to the branch' do
        before do
          create(:protected_branch, :developers_can_merge,
                 name: pipeline.ref, project: project)
        end

        it 'includes ability to update pipeline' 

      end

      context 'when no one can create the tag' do
        before do
          create(:protected_tag, :no_one_can_create,
                 name: pipeline.ref, project: project)

          pipeline.update(tag: true)
        end

        it 'does not include ability to update pipeline' 

      end

      context 'when no one can create the tag but it is not a tag' do
        before do
          create(:protected_tag, :no_one_can_create,
                 name: pipeline.ref, project: project)
        end

        it 'includes ability to update pipeline' 

      end
    end

    context 'when maintainer is allowed to push to pipeline branch' do
      let(:project) { create(:project, :public) }
      let(:owner) { user }

      it 'enables update_pipeline if user is maintainer' 

    end
  end
end

