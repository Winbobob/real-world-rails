#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe WikiController, type: :controller do
  before do
    Role.delete_all # removing me makes us faster
    User.delete_all # removing me makes us faster
    I18n.locale = :en
  end

  describe 'actions' do
    before do
      allow(@controller).to receive(:set_localization)

      @role = FactoryBot.create(:non_member)
      @user = FactoryBot.create(:admin)

      allow(User).to receive(:current).and_return @user

      @project = FactoryBot.create(:project)
      @project.reload # to get the wiki into the proxy

      # creating pages
      @existing_page = FactoryBot.create(:wiki_page, wiki_id: @project.wiki.id,
                                                      title:   'ExistingPage')

      # creating page contents
      FactoryBot.create(:wiki_content, page_id:   @existing_page.id,
                                        author_id: @user.id)
    end

    shared_examples_for "a 'new' action" do
      it 'assigns @project to the current project' 


      it 'assigns @page to a newly created wiki page' 


      it 'assigns @content to a newly created wiki content' 


      it 'renders the new action' 

    end

    describe 'new' do
      let(:get_page) { get 'new', params: { project_id: @project } }

      it_should_behave_like "a 'new' action"
    end

    describe 'new_child' do
      let(:get_page) { get 'new_child', params: { project_id: @project, id: @existing_page.title } }

      it_should_behave_like "a 'new' action"

      it 'sets the parent page for the new page' 


      it 'renders 404 if used with an unknown page title' 

    end

    describe 'create' do
      describe 'successful action' do
        it 'redirects to the show action' 


        it 'saves a new WikiPage with proper content' 

      end

      describe 'unsuccessful action' do
        it 'renders "wiki/new"' 


        it 'assigns project to work with new template' 


        it 'assigns wiki to work with new template' 


        it 'assigns page to work with new template' 


        it 'assigns content to work with new template' 

      end
    end

    describe 'destroy' do
      describe 'successful action' do
        context 'when it is not the only wiki page' do
          let(:wiki) { @project.wiki }
          let(:redirect_page_after_destroy) { wiki.find_page(wiki.start_page) || wiki.pages.first }

          before do
            another_wiki_page = FactoryBot.create :wiki_page, wiki: wiki
          end

          it 'redirects to wiki#index' 

        end

        context 'when it is the only wiki page' do
          it 'redirects to projects#show' 

        end
      end
    end
  end # describe 'actions'

  describe 'view related stuff' do
    render_views

    before :each do
      allow(@controller).to receive(:set_localization)
      allow(Setting).to receive(:login_required?).and_return(false)

      @role = FactoryBot.create(:non_member)
      @user = FactoryBot.create(:admin)

      @anon = User.anonymous.nil? ? FactoryBot.create(:anonymous) : User.anonymous

      Role.anonymous.update_attributes name: I18n.t(:default_role_anonymous),
                                       permissions: [:view_wiki_pages]

      allow(User).to receive(:current).and_return @user

      @project = FactoryBot.create(:public_project)
      @project.reload # to get the wiki into the proxy

      # creating pages
      @page_default = FactoryBot.create(:wiki_page, wiki_id: @project.wiki.id,
                                                    title:   'Wiki')
      @page_with_content = FactoryBot.create(:wiki_page, wiki_id: @project.wiki.id,
                                                         title:   'PagewithContent')
      @page_without_content = FactoryBot.create(:wiki_page, wiki_id: @project.wiki.id,
                                                            title:   'PagewithoutContent')
      @unrelated_page = FactoryBot.create(:wiki_page, wiki_id: @project.wiki.id,
                                                      title:   'UnrelatedPage')

      # creating page contents
      FactoryBot.create(:wiki_content, page_id:   @page_default.id,
                                       author_id: @user.id)
      FactoryBot.create(:wiki_content, page_id:   @page_with_content.id,
                                       author_id: @user.id)
      FactoryBot.create(:wiki_content, page_id:   @unrelated_page.id,
                                       author_id: @user.id)

      # creating some child pages
      @children = {}
      [@page_with_content].each do |page|
        child_page = FactoryBot.create(:wiki_page, wiki_id:   @project.wiki.id,
                                                   parent_id: page.id,
                                                   title:     page.title + ' child')
        FactoryBot.create(:wiki_content, page_id: child_page.id,
                                         author_id: @user.id)

        @children[page] = child_page
      end
    end

    describe '- main menu links' do
      before do
        @main_menu_item_for_page_with_content = FactoryBot.create(:wiki_menu_item, navigatable_id: @project.wiki.id,
                                                                                    title:    'Item for Page with Content',
                                                                                    name:   @page_with_content.slug)

        @main_menu_item_for_new_wiki_page = FactoryBot.create(:wiki_menu_item, navigatable_id: @project.wiki.id,
                                                                                title:    'Item for new WikiPage',
                                                                                name:   'new-wiki-page')

        @other_menu_item = FactoryBot.create(:wiki_menu_item, navigatable_id: @project.wiki.id,
                                                               title:    'Item for other page',
                                                               name:   @unrelated_page.slug)
      end

      shared_examples_for 'all wiki menu items' do
        it 'is inactive, when an unrelated page is shown' 


        it "is inactive, when another wiki menu item's page is shown" 


        it 'is active, when the given wiki menu item is shown' 

      end

      shared_examples_for 'all existing wiki menu items' do
        # TODO: Add tests for new and toc options within menu item
        it 'is active on parents item, when new page is shown' 


        it 'is active, when a toc page is shown' 

      end

      shared_examples_for 'all wiki menu items with child pages' do
        it 'is active, when the given wiki menu item is an ancestor of the shown page' 

      end

      describe '- wiki menu item pointing to a saved wiki page' do
        before do
          @wiki_menu_item = @main_menu_item_for_page_with_content
          @other_wiki_menu_item = @other_menu_item
          @child_page = @children[@page_with_content]
        end

        it_should_behave_like 'all wiki menu items'
        it_should_behave_like 'all existing wiki menu items'
        it_should_behave_like 'all wiki menu items with child pages'
      end

      describe '- wiki menu item pointing to a new wiki page' do
        before do
          @wiki_menu_item = @main_menu_item_for_new_wiki_page
          @other_wiki_menu_item = @other_menu_item
        end

        it_should_behave_like 'all wiki menu items'
      end

      describe '- wiki_menu_item containing special chars only' do
        before do
          @wiki_menu_item = FactoryBot.create(:wiki_menu_item, navigatable_id: @project.wiki.id,
                                                                title:    '?',
                                                                name:   'help')
          @other_wiki_menu_item = @other_menu_item
        end

        it_should_behave_like 'all wiki menu items'
      end
    end

    describe '- wiki sidebar' do
      describe 'configure menu items link' do
        describe 'on a show page' do
          describe 'being authorized to configure menu items' do
            it 'is visible' 

          end

          describe 'being unauthorized to configure menu items' do
            before do
              allow(User).to receive(:current).and_return @anon
            end

            it 'is invisible' 

          end
        end
      end

      describe 'new child page link' do
        describe 'on an index page' do
          describe 'being authorized to edit wiki pages' do
            it 'is invisible' 

          end

          describe 'being unauthorized to edit wiki pages' do
            before do
              allow(User).to receive(:current).and_return @anon
            end

            it 'is invisible' 

          end
        end

        describe 'on a wiki page' do
          describe 'being authorized to edit wiki pages' do
            describe 'with a wiki page present' do
              it 'is visible' 

            end

            describe 'with no wiki page present' do
              it 'is invisible' 

            end
          end

          describe 'being unauthorized to edit wiki pages' do
            before do
              allow(User).to receive(:current).and_return @anon
            end

            it 'is invisible' 

          end
        end
      end

      describe 'new page link' do
        describe 'on a show page' do
          describe 'being authorized to edit wiki pages' do
            it 'is visible' 

          end

          describe 'being unauthorized to edit wiki pages' do
            before do
              allow(User).to receive(:current).and_return @anon
            end

            it 'is invisible' 

          end
        end
      end
    end
  end
end

