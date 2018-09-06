require 'spec_helper'

describe 'User searches for merge requests', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, namespace: user.namespace) }
  let!(:merge_request1) { create(:merge_request, title: 'Foo', source_project: project, target_project: project) }
  let!(:merge_request2) { create(:merge_request, :simple, title: 'Bar', source_project: project, target_project: project) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(search_path)
  end

  include_examples 'top right search form'

  it 'finds a merge request' 


  context 'when on a project page' do
    it 'finds a merge request' 

  end
end

