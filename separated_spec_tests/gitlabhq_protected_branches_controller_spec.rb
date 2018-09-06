require('spec_helper')

describe Projects::ProtectedBranchesController do
  let(:project) { create(:project, :repository) }
  let(:protected_branch) { create(:protected_branch, project: project) }
  let(:project_params) { { namespace_id: project.namespace.to_param, project_id: project } }
  let(:base_params) { project_params.merge(id: protected_branch.id) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
  end

  describe "GET #index" do
    let(:project) { create(:project_empty_repo, :public) }

    it "redirects empty repo to projects page" 

  end

  describe "POST #create" do
    let(:master_access_level) { [{ access_level: Gitlab::Access::MASTER }] }
    let(:access_level_params) do
      { merge_access_levels_attributes: master_access_level,
        push_access_levels_attributes: master_access_level }
    end
    let(:create_params) { attributes_for(:protected_branch).merge(access_level_params) }

    before do
      sign_in(user)
    end

    it 'creates the protected branch rule' 


    context 'when a policy restricts rule deletion' do
      before do
        policy = instance_double(ProtectedBranchPolicy, can?: false)
        allow(ProtectedBranchPolicy).to receive(:new).and_return(policy)
      end

      it "prevents creation of the protected branch rule" 

    end
  end

  describe "PUT #update" do
    let(:update_params) { { name: 'new_name' } }

    before do
      sign_in(user)
    end

    it 'updates the protected branch rule' 


    context 'when a policy restricts rule deletion' do
      before do
        policy = instance_double(ProtectedBranchPolicy, can?: false)
        allow(ProtectedBranchPolicy).to receive(:new).and_return(policy)
      end

      it "prevents update of the protected branch rule" 

    end
  end

  describe "DELETE #destroy" do
    before do
      sign_in(user)
    end

    it "deletes the protected branch rule" 


    context 'when a policy restricts rule deletion' do
      before do
        policy = instance_double(ProtectedBranchPolicy, can?: false)
        allow(ProtectedBranchPolicy).to receive(:new).and_return(policy)
      end

      it "prevents deletion of the protected branch rule" 

    end
  end
end

