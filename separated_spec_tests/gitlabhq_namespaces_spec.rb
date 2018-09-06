require 'spec_helper'

describe API::Namespaces do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:group1) { create(:group) }
  let!(:group2) { create(:group, :nested) }

  describe "GET /namespaces" do
    context "when unauthenticated" do
      it "returns authentication error" 

    end

    context "when authenticated as admin" do
      it "returns correct attributes" 


      it "admin: returns an array of all namespaces" 


      it "admin: returns an array of matched namespaces" 

    end

    context "when authenticated as a regular user" do
      it "returns correct attributes when user can admin group" 


      it "returns correct attributes when user cannot admin group" 


      it "user: returns an array of namespaces" 


      it "admin: returns an array of matched namespaces" 

    end
  end

  describe 'GET /namespaces/:id' do
    let(:owned_group) { group1 }
    let(:user2) { create(:user) }

    shared_examples 'can access namespace' do
      it 'returns namespace details' 

    end

    shared_examples 'namespace reader' do
      let(:requested_namespace) { owned_group }

      before do
        owned_group.add_owner(request_actor)
      end

      context 'when namespace exists' do
        context 'when requested by ID' do
          context 'when requesting group' do
            let(:namespace_id) { owned_group.id }

            it_behaves_like 'can access namespace'
          end

          context 'when requesting personal namespace' do
            let(:namespace_id) { request_actor.namespace.id }
            let(:requested_namespace) { request_actor.namespace }

            it_behaves_like 'can access namespace'
          end
        end

        context 'when requested by path' do
          context 'when requesting group' do
            let(:namespace_id) { owned_group.path }

            it_behaves_like 'can access namespace'
          end

          context 'when requesting personal namespace' do
            let(:namespace_id) { request_actor.namespace.path }
            let(:requested_namespace) { request_actor.namespace }

            it_behaves_like 'can access namespace'
          end
        end
      end

      context "when namespace doesn't exist" do
        it 'returns not-found' 

      end
    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated as regular user' do
      let(:request_actor) { user }

      context 'when requested namespace is not owned by user' do
        context 'when requesting group' do
          it 'returns not-found' 

        end

        context 'when requesting personal namespace' do
          it 'returns not-found' 

        end
      end

      context 'when requested namespace is owned by user' do
        it_behaves_like 'namespace reader'
      end
    end

    context 'when authenticated as admin' do
      let(:request_actor) { admin }

      context 'when requested namespace is not owned by user' do
        context 'when requesting group' do
          let(:namespace_id) { group2.id }
          let(:requested_namespace) { group2 }

          it_behaves_like 'can access namespace'
        end

        context 'when requesting personal namespace' do
          let(:namespace_id) { user2.namespace.id }
          let(:requested_namespace) { user2.namespace }

          it_behaves_like 'can access namespace'
        end
      end

      context 'when requested namespace is owned by user' do
        it_behaves_like 'namespace reader'
      end
    end
  end
end

