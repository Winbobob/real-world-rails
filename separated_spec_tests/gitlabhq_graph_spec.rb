require 'spec_helper'

describe 'Project Graph', :js do
  let(:user) { create :user }
  let(:project) { create(:project, :repository, namespace: user.namespace) }

  before do
    project.add_master(user)

    sign_in(user)
  end

  shared_examples 'page should have commits graphs' do
    it 'renders commits' 

  end

  shared_examples 'page should have languages graphs' do
    it 'renders languages' 

  end

  it 'renders graphs' 


  context 'commits graph' do
    before do
      visit commits_project_graph_path(project, 'master')
    end

    it_behaves_like 'page should have commits graphs'
    it_behaves_like 'page should have languages graphs'
  end

  context 'languages graph' do
    before do
      visit languages_project_graph_path(project, 'master')
    end

    it_behaves_like 'page should have commits graphs'
    it_behaves_like 'page should have languages graphs'
  end

  context 'charts graph' do
    before do
      visit charts_project_graph_path(project, 'master')
    end

    it_behaves_like 'page should have commits graphs'
    it_behaves_like 'page should have languages graphs'
  end

  context 'when CI enabled' do
    before do
      project.enable_ci

      visit ci_project_graph_path(project, 'master')
    end

    it 'renders CI graphs' 

  end
end

