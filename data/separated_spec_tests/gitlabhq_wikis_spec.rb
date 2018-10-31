require 'spec_helper'

# For every API endpoint we test 3 states of wikis:
# - disabled
# - enabled only for team members
# - enabled for everyone who has access
# Every state is tested for 3 user roles:
# - guest
# - developer
# - master
# because they are 3 edge cases of using wiki pages.

describe API::Wikis do
  let(:user) { create(:user) }
  let(:group) { create(:group).tap { |g| g.add_owner(user) } }
  let(:project_wiki) { create(:project_wiki, project: project, user: user) }
  let(:payload) { { content: 'content', format: 'rdoc', title: 'title' } }
  let(:expected_keys_with_content) { %w(content format slug title) }
  let(:expected_keys_without_content) { %w(format slug title) }

  shared_examples_for 'returns list of wiki pages' do
    context 'when wiki has pages' do
      let!(:pages) do
        [create(:wiki_page, wiki: project_wiki, attrs: { title: 'page1', content: 'content of page1' }),
         create(:wiki_page, wiki: project_wiki, attrs: { title: 'page2', content: 'content of page2' })]
      end

      it 'returns the list of wiki pages without content' 


      it 'returns the list of wiki pages with content' 

    end

    it 'return the empty list of wiki pages' 

  end

  shared_examples_for 'returns wiki page' do
    it 'returns the wiki page' 

  end

  shared_examples_for 'creates wiki page' do
    it 'creates the wiki page' 


    [:title, :content].each do |part|
      it "responds with validation error on empty #{part}" 

    end
  end

  shared_examples_for 'updates wiki page' do
    it 'updates the wiki page' 

  end

  shared_examples_for '403 Forbidden' do
    it 'returns 403 Forbidden' 

  end

  shared_examples_for '404 Wiki Page Not Found' do
    it 'returns 404 Wiki Page Not Found' 

  end

  shared_examples_for '404 Project Not Found' do
    it 'returns 404 Project Not Found' 

  end

  shared_examples_for '204 No Content' do
    it 'returns 204 No Content' 

  end

  describe 'GET /projects/:id/wikis' do
    let(:url) { "/projects/#{project.id}/wikis" }

    context 'when wiki is disabled' do
      let(:project) { create(:project, :wiki_repo, :wiki_disabled) }

      context 'when user is guest' do
        before do
          get api(url)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)

          get api(url, user)
        end

        include_examples '403 Forbidden'
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          get api(url, user)
        end

        include_examples '403 Forbidden'
      end
    end

    context 'when wiki is available only for team members' do
      let(:project) { create(:project, :wiki_repo, :wiki_private) }

      context 'when user is guest' do
        before do
          get api(url)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)
        end

        include_examples 'returns list of wiki pages'
      end

      context 'when user is master' do
        before do
          project.add_master(user)
        end

        include_examples 'returns list of wiki pages'
      end
    end

    context 'when wiki is available for everyone with access' do
      let(:project) { create(:project, :wiki_repo) }

      context 'when user is guest' do
        before do
          get api(url)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)
        end

        include_examples 'returns list of wiki pages'
      end

      context 'when user is master' do
        before do
          project.add_master(user)
        end

        include_examples 'returns list of wiki pages'
      end
    end
  end

  describe 'GET /projects/:id/wikis/:slug' do
    let(:page) { create(:wiki_page, wiki: project.wiki) }
    let(:url) { "/projects/#{project.id}/wikis/#{page.slug}" }

    context 'when wiki is disabled' do
      let(:project) { create(:project, :wiki_repo, :wiki_disabled) }

      context 'when user is guest' do
        before do
          get api(url)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)

          get api(url, user)
        end

        include_examples '403 Forbidden'
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          get api(url, user)
        end

        include_examples '403 Forbidden'
      end
    end

    context 'when wiki is available only for team members' do
      let(:project) { create(:project, :wiki_repo, :wiki_private) }

      context 'when user is guest' do
        before do
          get api(url)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)
          get api(url, user)
        end

        include_examples 'returns wiki page'

        context 'when page is not existing' do
          let(:url) { "/projects/#{project.id}/wikis/unknown" }

          include_examples '404 Wiki Page Not Found'
        end
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          get api(url, user)
        end

        include_examples 'returns wiki page'

        context 'when page is not existing' do
          let(:url) { "/projects/#{project.id}/wikis/unknown" }

          include_examples '404 Wiki Page Not Found'
        end
      end
    end

    context 'when wiki is available for everyone with access' do
      let(:project) { create(:project, :wiki_repo) }

      context 'when user is guest' do
        before do
          get api(url)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)

          get api(url, user)
        end

        include_examples 'returns wiki page'

        context 'when page is not existing' do
          let(:url) { "/projects/#{project.id}/wikis/unknown" }

          include_examples '404 Wiki Page Not Found'
        end
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          get api(url, user)
        end

        include_examples 'returns wiki page'

        context 'when page is not existing' do
          let(:url) { "/projects/#{project.id}/wikis/unknown" }

          include_examples '404 Wiki Page Not Found'
        end
      end
    end
  end

  describe 'POST /projects/:id/wikis' do
    let(:payload) { { title: 'title', content: 'content' } }
    let(:url) { "/projects/#{project.id}/wikis" }

    context 'when wiki is disabled' do
      let(:project) { create(:project, :wiki_disabled, :wiki_repo) }

      context 'when user is guest' do
        before do
          post(api(url), payload)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)
          post(api(url, user), payload)
        end

        include_examples '403 Forbidden'
      end

      context 'when user is master' do
        before do
          project.add_master(user)
          post(api(url, user), payload)
        end

        include_examples '403 Forbidden'
      end
    end

    context 'when wiki is available only for team members' do
      let(:project) { create(:project, :wiki_private, :wiki_repo) }

      context 'when user is guest' do
        before do
          post(api(url), payload)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)
        end

        include_examples 'creates wiki page'
      end

      context 'when user is master' do
        before do
          project.add_master(user)
        end

        include_examples 'creates wiki page'
      end
    end

    context 'when wiki is available for everyone with access' do
      let(:project) { create(:project, :wiki_repo) }

      context 'when user is guest' do
        before do
          post(api(url), payload)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)
        end

        include_examples 'creates wiki page'
      end

      context 'when user is master' do
        before do
          project.add_master(user)
        end

        include_examples 'creates wiki page'
      end
    end
  end

  describe 'PUT /projects/:id/wikis/:slug' do
    let(:page) { create(:wiki_page, wiki: project_wiki) }
    let(:payload) { { title: 'new title', content: 'new content' } }
    let(:url) { "/projects/#{project.id}/wikis/#{page.slug}" }

    context 'when wiki is disabled' do
      let(:project) { create(:project, :wiki_disabled, :wiki_repo) }

      context 'when user is guest' do
        before do
          put(api(url), payload)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)

          put(api(url, user), payload)
        end

        include_examples '403 Forbidden'
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          put(api(url, user), payload)
        end

        include_examples '403 Forbidden'
      end
    end

    context 'when wiki is available only for team members' do
      let(:project) { create(:project, :wiki_private, :wiki_repo) }

      context 'when user is guest' do
        before do
          put(api(url), payload)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)

          put(api(url, user), payload)
        end

        include_examples 'updates wiki page'

        context 'when page is not existing' do
          let(:url) { "/projects/#{project.id}/wikis/unknown" }

          include_examples '404 Wiki Page Not Found'
        end
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          put(api(url, user), payload)
        end

        include_examples 'updates wiki page'

        context 'when page is not existing' do
          let(:url) { "/projects/#{project.id}/wikis/unknown" }

          include_examples '404 Wiki Page Not Found'
        end
      end
    end

    context 'when wiki is available for everyone with access' do
      let(:project) { create(:project, :wiki_repo) }

      context 'when user is guest' do
        before do
          put(api(url), payload)
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)

          put(api(url, user), payload)
        end

        include_examples 'updates wiki page'

        context 'when page is not existing' do
          let(:url) { "/projects/#{project.id}/wikis/unknown" }

          include_examples '404 Wiki Page Not Found'
        end
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          put(api(url, user), payload)
        end

        include_examples 'updates wiki page'

        context 'when page is not existing' do
          let(:url) { "/projects/#{project.id}/wikis/unknown" }

          include_examples '404 Wiki Page Not Found'
        end
      end
    end

    context 'when wiki belongs to a group project' do
      let(:project) { create(:project, :wiki_repo, namespace: group) }

      before do
        put(api(url, user), payload)
      end

      include_examples 'updates wiki page'
    end
  end

  describe 'DELETE /projects/:id/wikis/:slug' do
    let(:page) { create(:wiki_page, wiki: project_wiki) }
    let(:url) { "/projects/#{project.id}/wikis/#{page.slug}" }

    context 'when wiki is disabled' do
      let(:project) { create(:project, :wiki_disabled, :wiki_repo) }

      context 'when user is guest' do
        before do
          delete(api(url))
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)

          delete(api(url, user))
        end

        include_examples '403 Forbidden'
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          delete(api(url, user))
        end

        include_examples '403 Forbidden'
      end
    end

    context 'when wiki is available only for team members' do
      let(:project) { create(:project, :wiki_private, :wiki_repo) }

      context 'when user is guest' do
        before do
          delete(api(url))
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)

          delete(api(url, user))
        end

        include_examples '403 Forbidden'
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          delete(api(url, user))
        end

        include_examples '204 No Content'
      end
    end

    context 'when wiki is available for everyone with access' do
      let(:project) { create(:project, :wiki_repo) }

      context 'when user is guest' do
        before do
          delete(api(url))
        end

        include_examples '404 Project Not Found'
      end

      context 'when user is developer' do
        before do
          project.add_developer(user)

          delete(api(url, user))
        end

        include_examples '403 Forbidden'
      end

      context 'when user is master' do
        before do
          project.add_master(user)

          delete(api(url, user))
        end

        include_examples '204 No Content'

        context 'when page is not existing' do
          let(:url) { "/projects/#{project.id}/wikis/unknown" }

          include_examples '404 Wiki Page Not Found'
        end
      end
    end

    context 'when wiki belongs to a group project' do
      let(:project) { create(:project, :wiki_repo, namespace: group) }

      before do
        delete(api(url, user))
      end

      include_examples '204 No Content'
    end
  end
end

