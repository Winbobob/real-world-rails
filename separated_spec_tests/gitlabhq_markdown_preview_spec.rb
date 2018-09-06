require 'spec_helper'

feature 'Projects > Wiki > User previews markdown changes', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, :wiki_repo, namespace: user.namespace) }
  let(:wiki_content) do
    <<-HEREDOC
[regular link](regular)
[relative link 1](../relative)
[relative link 2](./relative)
[relative link 3](./e/f/relative)
    HEREDOC
  end

  background do
    project.add_master(user)

    sign_in(user)

    visit project_path(project)
    find('.shortcuts-wiki').click
  end

  context "while creating a new wiki page" do
    context "when there are no spaces or hyphens in the page name" do
      it "rewrites relative links as expected" 

    end

    context "when there are spaces in the page name" do
      it "rewrites relative links as expected" 

    end

    context "when there are hyphens in the page name" do
      it "rewrites relative links as expected" 

    end
  end

  context "while editing a wiki page" do
    def create_wiki_page(path)
      find('.add-new-wiki').click

      page.within '#modal-new-wiki' do
        fill_in :new_wiki_path, with: path
        click_button 'Create page'
      end

      page.within '.wiki-form' do
        fill_in :wiki_content, with: 'content'
        click_on "Create page"
      end
    end

    context "when there are no spaces or hyphens in the page name" do
      it "rewrites relative links as expected" 

    end

    context "when there are spaces in the page name" do
      it "rewrites relative links as expected" 

    end

    context "when there are hyphens in the page name" do
      it "rewrites relative links as expected" 

    end
  end
end

