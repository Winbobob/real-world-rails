require 'spec_helper'

describe 'User searches for code' do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository, namespace: user.namespace) }

  context 'when signed in' do
    before do
      project.add_master(user)
      sign_in(user)
    end

    it 'finds a file' 


    context 'when on a project page', :js do
      before do
        visit(search_path)
      end

      include_examples 'top right search form'

      it 'finds code' 

    end
  end

  context 'when signed out' do
    let(:project) { create(:project, :public, :repository) }

    before do
      visit(project_path(project))
    end

    it 'finds code' 

  end
end

