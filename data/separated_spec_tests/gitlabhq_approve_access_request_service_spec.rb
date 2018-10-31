require 'spec_helper'

describe Members::ApproveAccessRequestService do
  let(:project) { create(:project, :public, :access_requestable) }
  let(:group) { create(:group, :public, :access_requestable) }
  let(:current_user) { create(:user) }
  let(:access_requester_user) { create(:user) }
  let(:access_requester) { source.requesters.find_by!(user_id: access_requester_user.id) }
  let(:opts) { {} }

  shared_examples 'a service raising ActiveRecord::RecordNotFound' do
    it 'raises ActiveRecord::RecordNotFound' 

  end

  shared_examples 'a service raising Gitlab::Access::AccessDeniedError' do
    it 'raises Gitlab::Access::AccessDeniedError' 

  end

  shared_examples 'a service approving an access request' do
    it 'succeeds' 


    it 'returns a <Source>Member' 


    context 'with a custom access level' do
      it 'returns a ProjectMember with the custom access level' 

    end
  end

  context 'when an access requester is found' do
    before do
      project.request_access(access_requester_user)
      group.request_access(access_requester_user)
    end

    context 'when current user is nil' do
      let(:user) { nil }

      context 'and :ldap option is not given' do
        it_behaves_like 'a service raising Gitlab::Access::AccessDeniedError' do
          let(:source) { project }
        end

        it_behaves_like 'a service raising Gitlab::Access::AccessDeniedError' do
          let(:source) { group }
        end
      end

      context 'and :skip_authorization option is false' do
        let(:opts) { { skip_authorization: false } }

        it_behaves_like 'a service raising Gitlab::Access::AccessDeniedError' do
          let(:source) { project }
        end

        it_behaves_like 'a service raising Gitlab::Access::AccessDeniedError' do
          let(:source) { group }
        end
      end

      context 'and :skip_authorization option is true' do
        let(:opts) { { skip_authorization: true } }

        it_behaves_like 'a service approving an access request' do
          let(:source) { project }
        end

        it_behaves_like 'a service approving an access request' do
          let(:source) { group }
        end
      end
    end

    context 'when current user cannot approve access request to the project' do
      it_behaves_like 'a service raising Gitlab::Access::AccessDeniedError' do
        let(:source) { project }
      end

      it_behaves_like 'a service raising Gitlab::Access::AccessDeniedError' do
        let(:source) { group }
      end
    end

    context 'when current user can approve access request to the project' do
      before do
        project.add_master(current_user)
        group.add_owner(current_user)
      end

      it_behaves_like 'a service approving an access request' do
        let(:source) { project }
      end

      it_behaves_like 'a service approving an access request' do
        let(:source) { group }
      end
    end
  end
end

