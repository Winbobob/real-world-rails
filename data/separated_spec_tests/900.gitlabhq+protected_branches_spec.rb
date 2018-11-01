require 'spec_helper'

describe API::ProtectedBranches do
  let(:user) { create(:user) }
  let!(:project) { create(:project, :repository) }
  let(:protected_name) { 'feature' }
  let(:branch_name) { protected_name }
  let!(:protected_branch) do
    create(:protected_branch, project: project, name: protected_name)
  end

  describe "GET /projects/:id/protected_branches" do
    let(:route) { "/projects/#{project.id}/protected_branches" }

    shared_examples_for 'protected branches' do
      it 'returns the protected branches' 

    end

    context 'when authenticated as a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like 'protected branches'
    end

    context 'when authenticated as a guest' do
      before do
        project.add_guest(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end
  end

  describe "GET /projects/:id/protected_branches/:branch" do
    let(:route) { "/projects/#{project.id}/protected_branches/#{branch_name}" }

    shared_examples_for 'protected branch' do
      it 'returns the protected branch' 


      context 'when protected branch does not exist' do
        let(:branch_name) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { get api(route, user) }
          let(:message) { '404 Not found' }
        end
      end
    end

    context 'when authenticated as a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like 'protected branch'

      context 'when protected branch contains a wildcard' do
        let(:protected_name) { 'feature*' }

        it_behaves_like 'protected branch'
      end

      context 'when protected branch contains a period' do
        let(:protected_name) { 'my.feature' }

        it_behaves_like 'protected branch'
      end
    end

    context 'when authenticated as a guest' do
      before do
        project.add_guest(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end
  end

  describe 'POST /projects/:id/protected_branches' do
    let(:branch_name) { 'new_branch' }
    let(:post_endpoint) { api("/projects/#{project.id}/protected_branches", user) }

    def expect_protection_to_be_successful
      expect(response).to have_gitlab_http_status(201)
      expect(json_response['name']).to eq(branch_name)
    end

    context 'when authenticated as a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it 'protects a single branch' 


      it 'protects a single branch and developers can push' 


      it 'protects a single branch and developers can merge' 


      it 'protects a single branch and developers can push and merge' 


      it 'protects a single branch and no one can push' 


      it 'protects a single branch and no one can merge' 


      it 'protects a single branch and no one can push or merge' 


      it 'returns a 409 error if the same branch is protected twice' 


      context 'when branch has a wildcard in its name' do
        let(:branch_name) { 'feature/*' }

        it "protects multiple branches with a wildcard in the name" 

      end

      context 'when a policy restricts rule deletion' do
        before do
          policy = instance_double(ProtectedBranchPolicy, can?: false)
          expect(ProtectedBranchPolicy).to receive(:new).and_return(policy)
        end

        it "prevents deletion of the protected branch rule" 

      end
    end

    context 'when authenticated as a guest' do
      before do
        project.add_guest(user)
      end

      it "returns a 403 error if guest" 

    end
  end

  describe "DELETE /projects/:id/protected_branches/unprotect/:branch" do
    let(:delete_endpoint) { api("/projects/#{project.id}/protected_branches/#{branch_name}", user) }

    before do
      project.add_maintainer(user)
    end

    it "unprotects a single branch" 


    it_behaves_like '412 response' do
      let(:request) { delete_endpoint }
    end

    it "returns 404 if branch does not exist" 


    context 'when a policy restricts rule deletion' do
      before do
        policy = instance_double(ProtectedBranchPolicy, can?: false)
        expect(ProtectedBranchPolicy).to receive(:new).and_return(policy)
      end

      it "prevents deletion of the protected branch rule" 

    end

    context 'when branch has a wildcard in its name' do
      let(:protected_name) { 'feature*' }

      it "unprotects a wildcard branch" 

    end
  end
end

