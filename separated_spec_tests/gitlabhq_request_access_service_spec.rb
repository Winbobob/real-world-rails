require 'spec_helper'

describe Members::RequestAccessService do
  let(:user) { create(:user) }

  shared_examples 'a service raising Gitlab::Access::AccessDeniedError' do
    it 'raises Gitlab::Access::AccessDeniedError' 

  end

  shared_examples 'a service creating a access request' do
    it 'succeeds' 


    it 'returns a <Source>Member' 

  end

  context 'when source is nil' do
    it_behaves_like 'a service raising Gitlab::Access::AccessDeniedError' do
      let(:source) { nil }
    end
  end

  context 'when current user cannot request access to the project' do
    %i[project group].each do |source_type|
      it_behaves_like 'a service raising Gitlab::Access::AccessDeniedError' do
        let(:source) { create(source_type, :private) }
      end
    end
  end

  context 'when access requests are disabled' do
    %i[project group].each do |source_type|
      it_behaves_like 'a service raising Gitlab::Access::AccessDeniedError' do
        let(:source) { create(source_type, :public) }
      end
    end
  end

  context 'when current user can request access to the project' do
    %i[project group].each do |source_type|
      it_behaves_like 'a service creating a access request' do
        let(:source) { create(source_type, :public, :access_requestable) }
      end
    end
  end
end

