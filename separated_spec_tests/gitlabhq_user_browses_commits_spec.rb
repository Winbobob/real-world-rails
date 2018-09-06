require 'spec_helper'

describe 'User browses commits' do
  include RepoHelpers

  let(:user) { create(:user) }
  let(:project) { create(:project, :repository, namespace: user.namespace) }

  before do
    project.add_master(user)
    sign_in(user)
  end

  it 'renders commit' 


  it 'fill commit sha when click new tag from commit page' 


  it 'renders inline diff button when click side-by-side diff button' 


  it 'renders breadcrumbs on specific commit path' 


  it 'renders diff links to both the previous and current image' 


  context 'when commit has ci status' do
    let(:pipeline) { create(:ci_pipeline, project: project, sha: sample_commit.id) }

    before do
      project.enable_ci

      create(:ci_build, pipeline: pipeline)

      allow_any_instance_of(Ci::Pipeline).to receive(:ci_yaml_file).and_return('')
    end

    it 'renders commit ci info' 

  end

  context 'primary email' do
    it 'finds a commit by a primary email' 

  end

  context 'secondary email' do
    it 'finds a commit by a secondary email' 

  end

  context 'when the blob does not exist' do
    let(:commit) { create(:commit, project: project) }

    it 'shows a blank label' 

  end

  describe 'commits list' do
    let(:visit_commits_page) do
      visit project_commits_path(project, project.repository.root_ref, limit: 5)
    end

    it 'searches commit', :js do
      visit_commits_page
      fill_in 'commits-search', with: 'submodules'

      expect(page).to have_content 'More submodules'
      expect(page).not_to have_content 'Change some files'
    end

    it 'renders commits atom feed' 


    context 'master branch' do
      before do
        visit_commits_page
      end

      it 'renders project commits' 


      it 'does not render create merge request button' 


      context 'when click the compare tab' do
        before do
          click_link('Compare')
        end

        it 'does not render create merge request button' 

      end
    end

    context 'feature branch' do
      let(:visit_commits_page) do
        visit project_commits_path(project, 'feature')
      end

      context 'when project does not have open merge requests' do
        before do
          visit_commits_page
        end

        it 'renders project commits' 


        it 'renders create merge request button' 


        context 'when click the compare tab' do
          before do
            click_link('Compare')
          end

          it 'renders create merge request button' 

        end
      end

      context 'when project have open merge request' do
        let!(:merge_request) do
          create(
            :merge_request,
            title: 'Feature',
            source_project: project,
            source_branch: 'feature',
            target_branch: 'master',
            author: project.users.first
          )
        end

        before do
          visit_commits_page
        end

        it 'renders project commits' 


        it 'renders button to the merge request' 


        context 'when click the compare tab' do
          before do
            click_link('Compare')
          end

          it 'renders button to the merge request' 

        end
      end
    end
  end
end

private

def check_author_link(email, author)
  author_link = find('.commit-author-link')

  expect(author_link['href']).to eq(user_path(author))
  expect(author_link['title']).to eq(email)
  expect(find('.commit-author-name').text).to eq(author.name)
end

