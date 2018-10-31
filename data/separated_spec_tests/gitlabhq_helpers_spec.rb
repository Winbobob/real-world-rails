require 'spec_helper'

describe API::Helpers do
  subject { Class.new.include(described_class).new }

  describe '#find_project' do
    let(:project) { create(:project) }

    shared_examples 'project finder' do
      context 'when project exists' do
        it 'returns requested project' 


        it 'returns nil' 

      end
    end

    context 'when ID is used as an argument' do
      let(:existing_id) { project.id }
      let(:non_existing_id) { (Project.maximum(:id) || 0) + 1 }

      it_behaves_like 'project finder'
    end

    context 'when PATH is used as an argument' do
      let(:existing_id) { project.full_path }
      let(:non_existing_id) { 'something/else' }

      it_behaves_like 'project finder'

      context 'with an invalid PATH' do
        let(:non_existing_id) { 'undefined' } # path without slash

        it_behaves_like 'project finder'

        it 'does not hit the database' 

      end
    end
  end

  describe '#find_namespace' do
    let(:namespace) { create(:namespace) }

    shared_examples 'namespace finder' do
      context 'when namespace exists' do
        it 'returns requested namespace' 

      end

      context "when namespace doesn't exists" do
        it 'returns nil' 

      end
    end

    context 'when ID is used as an argument' do
      let(:existing_id) { namespace.id }
      let(:non_existing_id) { 9999 }

      it_behaves_like 'namespace finder'
    end

    context 'when PATH is used as an argument' do
      let(:existing_id) { namespace.path }
      let(:non_existing_id) { 'non-existing-path' }

      it_behaves_like 'namespace finder'
    end
  end

  shared_examples 'user namespace finder' do
    let(:user1) { create(:user) }

    before do
      allow(subject).to receive(:current_user).and_return(user1)
      allow(subject).to receive(:header).and_return(nil)
      allow(subject).to receive(:not_found!).and_raise('404 Namespace not found')
    end

    context 'when namespace is group' do
      let(:namespace) { create(:group) }

      context 'when user has access to group' do
        before do
          namespace.add_guest(user1)
          namespace.save!
        end

        it 'returns requested namespace' 

      end

      context "when user doesn't have access to group" do
        it 'raises not found error' 

      end
    end

    context "when namespace is user's personal namespace" do
      let(:namespace) { create(:namespace) }

      context 'when user owns the namespace' do
        before do
          namespace.owner = user1
          namespace.save!
        end

        it 'returns requested namespace' 

      end

      context "when user doesn't own the namespace" do
        it 'raises not found error' 

      end
    end
  end

  describe '#find_namespace!' do
    let(:namespace_finder) do
      subject.find_namespace!(namespace.id)
    end

    it_behaves_like 'user namespace finder'
  end

  describe '#user_namespace' do
    let(:namespace_finder) do
      subject.user_namespace
    end

    before do
      allow(subject).to receive(:params).and_return({ id: namespace.id })
    end

    it_behaves_like 'user namespace finder'
  end
end

