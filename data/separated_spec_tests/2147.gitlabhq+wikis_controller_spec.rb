require 'spec_helper'

describe Projects::WikisController do
  let(:project) { create(:project, :public, :repository) }
  let(:user) { project.owner }
  let(:project_wiki) { ProjectWiki.new(project, user) }
  let(:wiki) { project_wiki.wiki }
  let(:wiki_title) { 'page-title-test' }

  before do
    create_page(wiki_title, 'hello world')

    sign_in(user)
  end

  after do
    destroy_page(wiki_title)
  end

  describe 'GET #show' do
    render_views

    subject { get :show, namespace_id: project.namespace, project_id: project, id: wiki_title }

    it 'limits the retrieved pages for the sidebar' 


    context 'when page content encoding is invalid' do
      it 'sets flash error' 

    end

    context 'when page is a file' do
      include WikiHelpers

      let(:path) { upload_file_to_wiki(project, user, file_name) }

      before do
        subject
      end

      subject { get :show, namespace_id: project.namespace, project_id: project, id: path }

      context 'when file is an image' do
        let(:file_name) { 'dk.png' }

        it 'renders the content inline' 


        context 'when file is a svg' do
          let(:file_name) { 'unsanitized.svg' }

          it 'renders the content as an attachment' 

        end
      end

      context 'when file is a pdf' do
        let(:file_name) { 'git-cheat-sheet.pdf' }

        it 'sets the content type to application/octet-stream' 

      end
    end
  end

  describe 'POST #preview_markdown' do
    it 'renders json in a correct format' 

  end

  describe 'GET #edit' do
    subject { get(:edit, namespace_id: project.namespace, project_id: project, id: wiki_title) }

    context 'when page content encoding is invalid' do
      it 'redirects to show' 

    end

    context 'when page content encoding is valid' do
      render_views

      it 'shows the edit page' 

    end
  end

  describe 'PATCH #update' do
    let(:new_title) { 'New title' }
    let(:new_content) { 'New content' }
    subject do
      patch(:update,
            namespace_id: project.namespace,
            project_id: project,
            id: wiki_title,
            wiki: { title: new_title, content: new_content })
    end

    context 'when page content encoding is invalid' do
      it 'redirects to show' 

    end

    context 'when page content encoding is valid' do
      render_views

      it 'updates the page' 

    end
  end

  def create_page(name, content)
    wiki.write_page(name, :markdown, content, commit_details(name))
  end

  def commit_details(name)
    Gitlab::Git::Wiki::CommitDetails.new(user.id, user.username, user.name, user.email, "created page #{name}")
  end

  def destroy_page(title, dir = '')
    page = wiki.page(title: title, dir: dir)
    project_wiki.delete_page(page, "test commit")
  end
end

