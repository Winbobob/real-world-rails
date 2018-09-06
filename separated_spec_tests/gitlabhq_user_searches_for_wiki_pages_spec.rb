require 'spec_helper'

describe 'User searches for wiki pages', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, :wiki_repo, namespace: user.namespace) }
  let!(:wiki_page) { create(:wiki_page, wiki: project.wiki, attrs: { title: 'test_wiki', content: 'Some Wiki content' }) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(search_path)
  end

  include_examples 'top right search form'

  it 'finds a page' 

end

