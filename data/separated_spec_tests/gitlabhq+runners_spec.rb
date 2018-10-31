require 'spec_helper'

describe API::Runners do
  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  let(:project) { create(:project, creator_id: user.id) }
  let(:project2) { create(:project, creator_id: user.id) }

  let(:group) { create(:group).tap { |group| group.add_owner(user) } }
  let(:group2) { create(:group).tap { |group| group.add_owner(user) } }

  let!(:shared_runner) { create(:ci_runner, :instance, description: 'Shared runner') }
  let!(:project_runner) { create(:ci_runner, :project, description: 'Project runner', projects: [project]) }
  let!(:two_projects_runner) { create(:ci_runner, :project, description: 'Two projects runner', projects: [project, project2]) }
  let!(:group_runner) { create(:ci_runner, :group, description: 'Group runner', groups: [group]) }

  before do
    # Set project access for users
    create(:project_member, :maintainer, user: user, project: project)
    create(:project_member, :maintainer, user: user, project: project2)
    create(:project_member, :reporter, user: user2, project: project)
  end

  describe 'GET /runners' do
    context 'authorized user' do
      it 'returns response status and headers' 


      it 'returns user available runners' 


      it 'filters runners by scope' 


      it 'avoids filtering if scope is invalid' 


      it 'filters runners by type' 


      it 'does not filter by invalid type' 


      it 'filters runners by status' 


      it 'does not filter by invalid status' 

    end

    context 'unauthorized user' do
      it 'does not return runners' 

    end
  end

  describe 'GET /runners/all' do
    context 'authorized user' do
      context 'with admin privileges' do
        it 'returns response status and headers' 


        it 'returns all runners' 


        it 'filters runners by scope' 


        it 'filters runners by scope' 


        it 'avoids filtering if scope is invalid' 


        it 'filters runners by type' 


        it 'does not filter by invalid type' 


        it 'filters runners by status' 


        it 'does not filter by invalid status' 

      end

      context 'without admin privileges' do
        it 'does not return runners list' 

      end
    end

    context 'unauthorized user' do
      it 'does not return runners' 

    end
  end

  describe 'GET /runners/:id' do
    context 'admin user' do
      context 'when runner is shared' do
        it "returns runner's details" 

      end

      context 'when runner is not shared' do
        context 'when unused runner is present' do
          let!(:unused_project_runner) { create(:ci_runner, :project, :without_projects) }

          it 'deletes unused runner' 

        end

        it "returns runner's details" 


        it "returns the project's details for a project runner" 

      end

      it 'returns 404 if runner does not exists' 

    end

    context "runner project's administrative user" do
      context 'when runner is not shared' do
        it "returns runner's details" 

      end

      context 'when runner is shared' do
        it "returns runner's details" 

      end
    end

    context 'other authorized user' do
      it "does not return project runner's details" 

    end

    context 'unauthorized user' do
      it "does not return project runner's details" 

    end
  end

  describe 'PUT /runners/:id' do
    context 'admin user' do
      # see https://gitlab.com/gitlab-org/gitlab-ce/issues/48625
      context 'single parameter update' do
        it 'runner description' 


        it 'runner active state' 


        it 'runner tag list' 


        it 'runner untagged flag' 


        it 'runner unlocked flag' 


        it 'runner access level' 


        it 'runner maximum timeout' 


        it 'fails with no parameters' 

      end

      context 'when runner is shared' do
        it 'updates runner' 

      end

      context 'when runner is not shared' do
        it 'updates runner' 

      end

      it 'returns 404 if runner does not exists' 


      def update_runner(id, user, args)
        put api("/runners/#{id}", user), args
      end
    end

    context 'authorized user' do
      context 'when runner is shared' do
        it 'does not update runner' 

      end

      context 'when runner is not shared' do
        it 'does not update project runner without access to it' 


        it 'updates project runner with access to it' 

      end
    end

    context 'unauthorized user' do
      it 'does not delete project runner' 

    end
  end

  describe 'DELETE /runners/:id' do
    context 'admin user' do
      context 'when runner is shared' do
        it 'deletes runner' 


        it_behaves_like '412 response' do
          let(:request) { api("/runners/#{shared_runner.id}", admin) }
        end
      end

      context 'when runner is not shared' do
        it 'deletes used project runner' 

      end

      it 'returns 404 if runner does not exists' 

    end

    context 'authorized user' do
      context 'when runner is shared' do
        it 'does not delete runner' 

      end

      context 'when runner is not shared' do
        it 'does not delete runner without access to it' 


        it 'does not delete project runner with more than one associated project' 


        it 'deletes project runner for one owned project' 


        it_behaves_like '412 response' do
          let(:request) { api("/runners/#{project_runner.id}", user) }
        end
      end
    end

    context 'unauthorized user' do
      it 'does not delete project runner' 

    end
  end

  describe 'GET /runners/:id/jobs' do
    set(:job_1) { create(:ci_build) }
    let!(:job_2) { create(:ci_build, :running, runner: shared_runner, project: project) }
    let!(:job_3) { create(:ci_build, :failed, runner: shared_runner, project: project) }
    let!(:job_4) { create(:ci_build, :running, runner: project_runner, project: project) }
    let!(:job_5) { create(:ci_build, :failed, runner: project_runner, project: project) }

    context 'admin user' do
      context 'when runner exists' do
        context 'when runner is shared' do
          it 'return jobs' 

        end

        context 'when runner is specific' do
          it 'return jobs' 

        end

        context 'when valid status is provided' do
          it 'return filtered jobs' 

        end

        context 'when invalid status is provided' do
          it 'return 400' 

        end
      end

      context "when runner doesn't exist" do
        it 'returns 404' 

      end
    end

    context "runner project's administrative user" do
      context 'when runner exists' do
        context 'when runner is shared' do
          it 'returns 403' 

        end

        context 'when runner is specific' do
          it 'return jobs' 

        end

        context 'when valid status is provided' do
          it 'return filtered jobs' 

        end

        context 'when invalid status is provided' do
          it 'return 400' 

        end
      end

      context "when runner doesn't exist" do
        it 'returns 404' 

      end
    end

    context 'other authorized user' do
      it 'does not return jobs' 

    end

    context 'unauthorized user' do
      it 'does not return jobs' 

    end
  end

  describe 'GET /projects/:id/runners' do
    context 'authorized user with maintainer privileges' do
      it 'returns response status and headers' 


      it 'returns all runners' 


      it 'filters runners by scope' 


      it 'avoids filtering if scope is invalid' 


      it 'filters runners by type' 


      it 'does not filter by invalid type' 


      it 'filters runners by status' 


      it 'does not filter by invalid status' 

    end

    context 'authorized user without maintainer privileges' do
      it "does not return project's runners" 

    end

    context 'unauthorized user' do
      it "does not return project's runners" 

    end
  end

  describe 'POST /projects/:id/runners' do
    context 'authorized user' do
      let(:project_runner2) { create(:ci_runner, :project, projects: [project2]) }

      it 'enables specific runner' 


      it 'avoids changes when enabling already enabled runner' 


      it 'does not enable locked runner' 


      it 'does not enable shared runner' 


      it 'does not enable group runner' 


      context 'user is admin' do
        context 'when project runner is used' do
          let!(:new_project_runner) { create(:ci_runner, :project) }

          it 'enables any specific runner' 

        end

        it 'enables a instance type runner' 

      end

      it 'raises an error when no runner_id param is provided' 

    end

    context 'user is not admin' do
      let!(:new_project_runner) { create(:ci_runner, :project) }

      it 'does not enable runner without access to' 

    end

    context 'authorized user without permissions' do
      it 'does not enable runner' 

    end

    context 'unauthorized user' do
      it 'does not enable runner' 

    end
  end

  describe 'DELETE /projects/:id/runners/:runner_id' do
    context 'authorized user' do
      context 'when runner have more than one associated projects' do
        it "disables project's runner" 


        it_behaves_like '412 response' do
          let(:request) { api("/projects/#{project.id}/runners/#{two_projects_runner.id}", user) }
        end
      end

      context 'when runner have one associated projects' do
        it "does not disable project's runner" 

      end

      it 'returns 404 is runner is not found' 

    end

    context 'authorized user without permissions' do
      it "does not disable project's runner" 

    end

    context 'unauthorized user' do
      it "does not disable project's runner" 

    end
  end
end

