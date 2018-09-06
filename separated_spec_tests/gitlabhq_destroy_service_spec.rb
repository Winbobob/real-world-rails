require 'spec_helper'

describe ProtectedBranches::DestroyService do
  let(:protected_branch) { create(:protected_branch) }
  let(:project) { protected_branch.project }
  let(:user) { project.owner }

  describe '#execute' do
    subject(:service) { described_class.new(project, user) }

    it 'destroys a protected branch' 


    context 'when a policy restricts rule deletion' do
      before do
        policy = instance_double(ProtectedBranchPolicy, can?: false)
        expect(ProtectedBranchPolicy).to receive(:new).and_return(policy)
      end

      it "prevents deletion of the protected branch rule" 

    end
  end
end

