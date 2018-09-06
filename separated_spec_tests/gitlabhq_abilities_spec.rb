require 'spec_helper'

describe Gitlab::Ci::Pipeline::Chain::Validate::Abilities do
  set(:project) { create(:project, :repository) }
  set(:user) { create(:user) }

  let(:pipeline) do
    build_stubbed(:ci_pipeline, project: project)
  end

  let(:command) do
    Gitlab::Ci::Pipeline::Chain::Command.new(
      project: project, current_user: user, origin_ref: ref)
  end

  let(:step) { described_class.new(pipeline, command) }

  let(:ref) { 'master' }

  context 'when users has no ability to run a pipeline' do
    before do
      step.perform!
    end

    it 'adds an error about insufficient permissions' 


    it 'breaks the pipeline builder chain' 

  end

  context 'when user has ability to create a pipeline' do
    before do
      project.add_developer(user)

      step.perform!
    end

    it 'does not invalidate the pipeline' 


    it 'does not break the chain' 

  end

  describe '#allowed_to_create?' do
    subject { step.allowed_to_create? }

    context 'when user is a developer' do
      before do
        project.add_developer(user)
      end

      it { is_expected.to be_truthy }

      context 'when the branch is protected' do
        let!(:protected_branch) do
          create(:protected_branch, project: project, name: ref)
        end

        it { is_expected.to be_falsey }

        context 'when developers are allowed to merge' do
          let!(:protected_branch) do
            create(:protected_branch,
                   :developers_can_merge,
                   project: project,
                   name: ref)
          end

          it { is_expected.to be_truthy }
        end
      end

      context 'when the tag is protected' do
        let(:ref) { 'v1.0.0' }

        let!(:protected_tag) do
          create(:protected_tag, project: project, name: ref)
        end

        it { is_expected.to be_falsey }

        context 'when developers are allowed to create the tag' do
          let!(:protected_tag) do
            create(:protected_tag,
                   :developers_can_create,
                   project: project,
                   name: ref)
          end

          it { is_expected.to be_truthy }
        end
      end
    end

    context 'when user is a master' do
      before do
        project.add_master(user)
      end

      it { is_expected.to be_truthy }

      context 'when the branch is protected' do
        let!(:protected_branch) do
          create(:protected_branch, project: project, name: ref)
        end

        it { is_expected.to be_truthy }
      end

      context 'when the tag is protected' do
        let(:ref) { 'v1.0.0' }

        let!(:protected_tag) do
          create(:protected_tag, project: project, name: ref)
        end

        it { is_expected.to be_truthy }

        context 'when no one can create the tag' do
          let!(:protected_tag) do
            create(:protected_tag,
                   :no_one_can_create,
                   project: project,
                   name: ref)
          end

          it { is_expected.to be_falsey }
        end
      end
    end

    context 'when owner cannot create pipeline' do
      it { is_expected.to be_falsey }
    end
  end
end

