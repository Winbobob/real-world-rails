require 'spec_helper'

describe ProtectedBranches::UpdateService do
  let(:protected_branch) { create(:protected_branch) }
  let(:project) { protected_branch.project }
  let(:user) { project.owner }
  let(:params) { { name: 'new protected branch name' } }

  describe '#execute' do
    subject(:service) { described_class.new(project, user, params) }

    it 'updates a protected branch' 


    context 'without admin_project permissions' do
      let(:user) { create(:user) }

      it "raises error" 

    end

    context 'when a policy restricts rule creation' do
      before do
        policy = instance_double(ProtectedBranchPolicy, can?: false)
        expect(ProtectedBranchPolicy).to receive(:new).and_return(policy)
      end

      it "prevents creation of the protected branch rule" 

    end
  end
end

