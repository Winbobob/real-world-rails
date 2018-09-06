require 'spec_helper'

describe 'User searches for issues', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, namespace: user.namespace) }
  let!(:issue1) { create(:issue, title: 'Foo', project: project) }
  let!(:issue2) { create(:issue, title: 'Bar', project: project) }

  context 'when signed in' do
    before do
      project.add_master(user)
      sign_in(user)

      visit(search_path)
    end

    include_examples 'top right search form'

    it 'finds an issue' 


    context 'when on a project page' do
      it 'finds an issue' 

    end
  end

  context 'when signed out' do
    let(:project) { create(:project, :public) }

    before do
      visit(search_path)
    end

    include_examples 'top right search form'

    it 'finds an issue' 

  end
end

