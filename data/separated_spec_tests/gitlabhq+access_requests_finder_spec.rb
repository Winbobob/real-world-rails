require 'spec_helper'

describe AccessRequestsFinder do
  let(:user) { create(:user) }
  let(:access_requester) { create(:user) }

  let(:project) do
    create(:project, :public, :access_requestable) do |project|
      project.request_access(access_requester)
    end
  end

  let(:group) do
    create(:group, :public, :access_requestable) do |group|
      group.request_access(access_requester)
    end
  end

  shared_examples 'a finder returning access requesters' do |method_name|
    it 'returns access requesters' 

  end

  shared_examples 'a finder returning no results' do |method_name|
    it 'raises Gitlab::Access::AccessDeniedError' 

  end

  shared_examples 'a finder raising Gitlab::Access::AccessDeniedError' do |method_name|
    it 'raises Gitlab::Access::AccessDeniedError' 

  end

  describe '#execute' do
    context 'when current user cannot see project access requests' do
      it_behaves_like 'a finder returning no results', :execute do
        let(:source) { project }
      end

      it_behaves_like 'a finder returning no results', :execute do
        let(:source) { group }
      end
    end

    context 'when current user can see access requests' do
      before do
        project.add_maintainer(user)
        group.add_owner(user)
      end

      it_behaves_like 'a finder returning access requesters', :execute do
        let(:source) { project }
      end

      it_behaves_like 'a finder returning access requesters', :execute do
        let(:source) { group }
      end
    end
  end

  describe '#execute!' do
    context 'when current user cannot see access requests' do
      it_behaves_like 'a finder raising Gitlab::Access::AccessDeniedError', :execute! do
        let(:source) { project }
      end

      it_behaves_like 'a finder raising Gitlab::Access::AccessDeniedError', :execute! do
        let(:source) { group }
      end
    end

    context 'when current user can see access requests' do
      before do
        project.add_maintainer(user)
        group.add_owner(user)
      end

      it_behaves_like 'a finder returning access requesters', :execute! do
        let(:source) { project }
      end

      it_behaves_like 'a finder returning access requesters', :execute! do
        let(:source) { group }
      end
    end
  end
end

