require 'spec_helper'

describe ProtectedBranches::CreateService do
  let(:project) { create(:project) }
  let(:user) { project.owner }
  let(:params) do
    {
      name: 'master',
      merge_access_levels_attributes: [{ access_level: Gitlab::Access::MAINTAINER }],
      push_access_levels_attributes: [{ access_level: Gitlab::Access::MAINTAINER }]
    }
  end

  describe '#execute' do
    subject(:service) { described_class.new(project, user, params) }

    it 'creates a new protected branch' 


    context 'when user does not have permission' do
      let(:user) { create(:user) }

      before do
        project.add_developer(user)
      end

      it 'creates a new protected branch if we skip authorization step' 


      it 'raises Gitlab::Access:AccessDeniedError' 

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

