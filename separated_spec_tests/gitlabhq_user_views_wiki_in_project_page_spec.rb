require 'spec_helper'

describe 'Projects > Wiki > User views wiki in project page' do
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)
  end

  context 'when repository is disabled for project' do
    let(:project) do
      create(:project,
             :wiki_repo,
             :repository_disabled,
             :merge_requests_disabled,
             :builds_disabled)
    end

    context 'when wiki homepage contains a link' do
      before do
        create(:wiki_page, wiki: project.wiki, attrs: { title: 'home', content: '[some link](other-page)' })
      end

      it 'displays the correct URL for the link' 

    end
  end
end

