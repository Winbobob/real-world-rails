require 'spec_helper'

describe 'Setting WIP status of a merge request' do
  include GraphqlHelpers

  let(:current_user) { create(:user) }
  let(:merge_request) { create(:merge_request) }
  let(:project) { merge_request.project }
  let(:input) { { wip: true } }

  let(:mutation) do
    variables = {
      project_path: project.full_path,
      iid: merge_request.iid
    }
    graphql_mutation(:merge_request_set_wip, variables.merge(input))
  end

  def mutation_response
    graphql_mutation_response(:merge_request_set_wip)
  end

  before do
    project.add_developer(current_user)
  end

  it 'returns an error if the user is not allowed to update the merge request' 


  it 'marks the merge request as WIP' 


  it 'does not do anything if the merge request was already marked `WIP`' 


  context 'when passing WIP false as input' do
    let(:input) { { wip: false } }

    it 'does not do anything if the merge reqeust was not marked wip' 


    it 'unmarks the merge request as `WIP`' 

  end
end

