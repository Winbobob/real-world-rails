require 'spec_helper'

describe Mutations::MergeRequests::SetWip do
  let(:merge_request) { create(:merge_request) }
  let(:user) { create(:user) }
  subject(:mutation) { described_class.new(object: nil, context: { current_user: user }) }

  describe '#resolve' do
    let(:wip) { true }
    let(:mutated_merge_request) { subject[:merge_request] }
    subject { mutation.resolve(project_path: merge_request.project.full_path, iid: merge_request.iid, wip: wip) }

    it 'raises an error if the resource is not accessible to the user' 


    context 'when the user can update the merge request' do
      before do
        merge_request.project.add_developer(user)
      end

      it 'returns the merge request as a wip' 


      it 'returns errors merge request could not be updated' 


      context 'when passing wip as false' do
        let(:wip) { false }

        it 'removes `wip` from the title' 


        it 'does not do anything if the title did not start with wip' 

      end
    end
  end
end

