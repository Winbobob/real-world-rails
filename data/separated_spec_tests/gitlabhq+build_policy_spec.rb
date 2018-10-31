require 'spec_helper'

describe Ci::BuildPolicy do
  let(:user) { create(:user) }
  let(:build) { create(:ci_build, pipeline: pipeline) }
  let(:pipeline) { create(:ci_empty_pipeline, project: project) }

  let(:policy) do
    described_class.new(user, build)
  end

  shared_context 'public pipelines disabled' do
    before do
      project.update_attribute(:public_builds, false)
    end
  end

  describe '#rules' do
    context 'when user does not have access to the project' do
      let(:project) { create(:project, :private) }

      context 'when public builds are enabled' do
        it 'does not include ability to read build' 

      end

      context 'when public builds are disabled' do
        include_context 'public pipelines disabled'

        it 'does not include ability to read build' 

      end
    end

    context 'when anonymous user has access to the project' do
      let(:project) { create(:project, :public) }

      context 'when public builds are enabled' do
        it 'includes ability to read build' 

      end

      context 'when public builds are disabled' do
        include_context 'public pipelines disabled'

        it 'does not include ability to read build' 

      end
    end

    context 'when team member has access to the project' do
      let(:project) { create(:project, :public) }

      context 'team member is a guest' do
        before do
          project.add_guest(user)
        end

        context 'when public builds are enabled' do
          it 'includes ability to read build' 

        end

        context 'when public builds are disabled' do
          include_context 'public pipelines disabled'

          it 'does not include ability to read build' 

        end
      end

      context 'team member is a reporter' do
        before do
          project.add_reporter(user)
        end

        context 'when public builds are enabled' do
          it 'includes ability to read build' 

        end

        context 'when public builds are disabled' do
          include_context 'public pipelines disabled'

          it 'does not include ability to read build' 

        end
      end

      context 'when maintainer is allowed to push to pipeline branch' do
        let(:project) { create(:project, :public) }
        let(:owner) { user }

        it 'enables update_build if user is maintainer' 

      end
    end

    describe 'rules for protected ref' do
      let(:project) { create(:project, :repository) }
      let(:build) { create(:ci_build, ref: 'some-ref', pipeline: pipeline) }

      before do
        project.add_developer(user)
      end

      context 'when no one can push or merge to the branch' do
        before do
          create(:protected_branch, :no_one_can_push,
                 name: build.ref, project: project)
        end

        it 'does not include ability to update build' 

      end

      context 'when developers can push to the branch' do
        before do
          create(:protected_branch, :developers_can_merge,
                 name: build.ref, project: project)
        end

        it 'includes ability to update build' 

      end

      context 'when no one can create the tag' do
        before do
          create(:protected_tag, :no_one_can_create,
                 name: build.ref, project: project)

          build.update(tag: true)
        end

        it 'does not include ability to update build' 

      end

      context 'when no one can create the tag but it is not a tag' do
        before do
          create(:protected_tag, :no_one_can_create,
                 name: build.ref, project: project)
        end

        it 'includes ability to update build' 

      end
    end

    describe 'rules for erase build' do
      let(:project) { create(:project, :repository) }
      let(:build) { create(:ci_build, pipeline: pipeline, ref: 'some-ref', user: owner) }

      context 'when a developer erases a build' do
        before do
          project.add_developer(user)
        end

        context 'when developers can push to the branch' do
          before do
            create(:protected_branch, :developers_can_push,
                   name: build.ref, project: project)
          end

          context 'when the build was created by the developer' do
            let(:owner) { user }

            it { expect(policy).to be_allowed :erase_build }
          end

          context 'when the build was created by the other' do
            let(:owner) { create(:user) }

            it { expect(policy).to be_disallowed :erase_build }
          end
        end

        context 'when no one can push or merge to the branch' do
          let(:owner) { user }

          before do
            create(:protected_branch, :no_one_can_push, :no_one_can_merge,
                   name: build.ref, project: project)
          end

          it { expect(policy).to be_disallowed :erase_build }
        end
      end

      context 'when a maintainer erases a build' do
        before do
          project.add_maintainer(user)
        end

        context 'when maintainers can push to the branch' do
          before do
            create(:protected_branch, :maintainers_can_push,
                   name: build.ref, project: project)
          end

          context 'when the build was created by the maintainer' do
            let(:owner) { user }

            it { expect(policy).to be_allowed :erase_build }
          end

          context 'when the build was created by the other' do
            let(:owner) { create(:user) }

            it { expect(policy).to be_allowed :erase_build }
          end
        end

        context 'when no one can push or merge to the branch' do
          let(:owner) { user }

          before do
            create(:protected_branch, :no_one_can_push, :no_one_can_merge,
                   name: build.ref, project: project)
          end

          it { expect(policy).to be_disallowed :erase_build }
        end
      end
    end
  end
end

