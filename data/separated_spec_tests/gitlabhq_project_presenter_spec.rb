require 'spec_helper'

describe ProjectPresenter do
  let(:user) { create(:user) }

  describe '#license_short_name' do
    let(:project) { create(:project) }
    let(:presenter) { described_class.new(project, current_user: user) }

    context 'when project.repository has a license_key' do
      it 'returns the nickname of the license if present' 


      it 'returns the name of the license if nickname is not present' 

    end

    context 'when project.repository has no license_key but a license_blob' do
      it 'returns LICENSE' 

    end
  end

  describe '#default_view' do
    let(:presenter) { described_class.new(project, current_user: user) }

    context 'user not signed in' do
      let(:user) { nil }

      context 'when repository is empty' do
        let(:project) { create(:project_empty_repo, :public) }

        it 'returns activity if user has repository access' 


        it 'returns activity if user does not have repository access' 

      end

      context 'when repository is not empty' do
        let(:project) { create(:project, :public, :repository) }

        it 'returns files and readme if user has repository access' 


        it 'returns activity if user does not have repository access' 

      end
    end

    context 'user signed in' do
      let(:user) { create(:user, :readme) }
      let(:project) { create(:project, :public, :repository) }

      context 'when the user is allowed to see the code' do
        it 'returns the project view' 

      end

      context 'with wikis enabled and the right policy for the user' do
        before do
          project.project_feature.update_attribute(:issues_access_level, 0)
          allow(presenter).to receive(:can?).with(user, :download_code, project).and_return(false)
        end

        it 'returns wiki if the user has the right policy' 


        it 'returns customize_workflow if the user does not have the right policy' 

      end

      context 'with issues as a feature available' do
        it 'return issues' 

      end

      context 'with no activity, no wikies and no issues' do
        it 'returns customize_workflow as default' 

      end
    end
  end

  describe '#can_current_user_push_code?' do
    let(:project) { create(:project, :repository) }
    let(:presenter) { described_class.new(project, current_user: user) }

    context 'empty repo' do
      let(:project) { create(:project) }

      it 'returns true if user can push_code' 


      it 'returns false if user cannot push_code' 

    end

    context 'not empty repo' do
      let(:project) { create(:project, :repository) }

      it 'returns true if user can push to default branch' 


      it 'returns false if default branch is protected' 

    end
  end

  context 'statistics anchors' do
    let(:project) { create(:project, :repository) }
    let(:presenter) { described_class.new(project, current_user: user) }

    describe '#files_anchor_data' do
      it 'returns files data' 

    end

    describe '#commits_anchor_data' do
      it 'returns commits data' 

    end

    describe '#branches_anchor_data' do
      it 'returns branches data' 

    end

    describe '#tags_anchor_data' do
      it 'returns tags data' 

    end

    describe '#new_file_anchor_data' do
      it 'returns new file data if user can push' 


      it 'returns nil if user cannot push' 


      context 'when the project is empty' do
        let(:project) { create(:project, :empty_repo) }

        # Since we protect the default branch for empty repos
        it 'is empty for a developer' 

      end
    end

    describe '#readme_anchor_data' do
      context 'when user can push and README does not exists' do
        it 'returns anchor data' 

      end

      context 'when README exists' do
        it 'returns anchor data' 

      end
    end

    describe '#changelog_anchor_data' do
      context 'when user can push and CHANGELOG does not exists' do
        it 'returns anchor data' 

      end

      context 'when CHANGELOG exists' do
        it 'returns anchor data' 

      end
    end

    describe '#license_anchor_data' do
      context 'when user can push and LICENSE does not exists' do
        it 'returns anchor data' 

      end

      context 'when LICENSE exists' do
        it 'returns anchor data' 

      end
    end

    describe '#contribution_guide_anchor_data' do
      context 'when user can push and CONTRIBUTING does not exists' do
        it 'returns anchor data' 

      end

      context 'when CONTRIBUTING exists' do
        it 'returns anchor data' 

      end
    end

    describe '#autodevops_anchor_data' do
      context 'when Auto Devops is enabled' do
        it 'returns anchor data' 

      end

      context 'when user can admin pipeline and CI yml does not exists' do
        it 'returns anchor data' 

      end
    end

    describe '#kubernetes_cluster_anchor_data' do
      context 'when user can create Kubernetes cluster' do
        it 'returns link to cluster if only one exists' 


        it 'returns link to clusters page if more than one exists' 


        it 'returns link to create a cluster if no cluster exists' 

      end

      context 'when user cannot create Kubernetes cluster' do
        it 'returns nil' 

      end
    end

    describe '#koding_anchor_data' do
      it 'returns link to setup Koding if user can push and no koding YML exists' 


      it 'returns nil if user cannot push' 


      it 'returns nil if koding is not enabled' 


      it 'returns nil if koding YML already exists' 

    end
  end
end

