require 'spec_helper'

describe 'User searches for milestones', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, namespace: user.namespace) }
  let!(:milestone1) { create(:milestone, title: 'Foo', project: project) }
  let!(:milestone2) { create(:milestone, title: 'Bar', project: project) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(search_path)
  end

  include_examples 'top right search form'

  it 'finds a milestone' 


  context 'when on a project page' do
    it 'finds a milestone' 

  end
end

