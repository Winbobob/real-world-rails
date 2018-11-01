# frozen_string_literal: true

require 'ostruct'
require 'spec_helper'

module Alchemy
  describe Admin::PagesController do
    context 'a guest' do
      it 'can not access page tree' 

    end

    context 'a member' do
      before { authorize_user(build(:alchemy_dummy_user)) }

      it 'can not access page tree' 

    end

    context 'with logged in editor user' do
      let(:user) { build(:alchemy_dummy_user, :as_editor) }

      before { authorize_user(user) }

      describe '#index' do
        let!(:language) { create(:alchemy_language) }

        context 'with existing language root page' do
          let!(:language_root) { create(:alchemy_page, :language_root) }

          it "assigns @page_root variable" 

        end

        context 'without language root page' do
          before do
            expect(Language).to receive(:current_root_page).and_return(nil)
            allow(Language).to receive(:current).and_return(language)
          end

          it "it assigns current language" 


          context "with multiple sites" do
            let!(:site_1_language_2) do
              create(:alchemy_language, code: 'fr')
            end

            let!(:site_2) do
              create(:alchemy_site, host: 'another-one.com')
            end

            let(:site_2_language) do
              site_2.default_language
            end

            before do
              create(:alchemy_page, :language_root, language: site_2_language)
              create(:alchemy_page, :language_root, language: site_1_language_2)
            end

            it "loads languages with pages from current site only" 

          end
        end

        context "with multiple sites" do
          let!(:site_2) do
            create(:alchemy_site, host: 'another-one.com')
          end

          let(:language_2) do
            site_2.default_language
          end

          it "loads languages from current site only" 

        end
      end

      describe '#tree' do
        let(:user)   { create(:alchemy_dummy_user, :as_editor) }
        let(:page_1) { create(:alchemy_page, visible: true, name: 'one') }
        let(:page_2) { create(:alchemy_page, visible: true, name: 'two', parent_id: page_1.id) }
        let(:page_3) { create(:alchemy_page, visible: true, name: 'three', parent_id: page_2.id) }
        let!(:pages) { [page_1, page_2, page_3] }

        subject :get_tree do
          get tree_admin_pages_path(id: page_1.id, full: 'true')
        end

        it 'returns a tree as JSON' 


        context "when branch is folded" do
          before do
            page_2.fold!(user.id, true)
          end

          it 'does not return a branch that is folded' 

        end

        context "when page is locked" do
          before do
            page_1.lock_to!(user)
          end

          it 'includes locked_notice if page is locked' 

        end
      end

      describe "#flush" do
        let(:content_page_1) do
          time = Time.current - 5.days
          create :alchemy_page,
            public_on: time,
            name: "content page 1",
            published_at: time
        end

        let(:content_page_2) do
          time = Time.current - 8.days
          create :alchemy_page,
            public_on: time,
            name: "content page 2",
            published_at: time
        end

        let(:layout_page_1) do
          create :alchemy_page,
            layoutpage: true,
            name: "layout_page 1",
            published_at: Time.current - 5.days
        end

        let(:layout_page_2) do
          create :alchemy_page,
            layoutpage: true,
            name: "layout_page 2",
            published_at: Time.current - 8.days
        end

        let(:content_pages) { [content_page_1, content_page_2] }
        let(:layout_pages) { [layout_page_1, layout_page_2] }

        it "should update the published_at field of content pages" 


        it "should update the published_at field of layout pages" 

      end

      describe '#new' do
        context "pages in clipboard" do
          let(:page) { mock_model(Alchemy::Page, name: 'Foobar') }

          before do
            allow_any_instance_of(described_class).to receive(:get_clipboard).with('pages') do
              [{'id' => page.id.to_s, 'action' => 'copy'}]
            end
          end

          it "should load all pages from clipboard" 

        end
      end

      describe '#show' do
        let(:language) { build_stubbed(:alchemy_language, locale: 'nl') }
        let(:page) { build_stubbed(:alchemy_page, language: language) }

        before do
          expect(Page).to receive(:find).with(page.id.to_s).and_return(page)
          allow(Page).to receive(:language_root_for).and_return(mock_model(Alchemy::Page))
        end

        it "should assign @preview_mode with true" 


        it "should store page as current preview" 


        it "should set the I18n locale to the pages language code" 


        it "renders the application layout" 

      end

      describe '#order' do
        let(:page_1)       { create(:alchemy_page, visible: true) }
        let(:page_2)       { create(:alchemy_page, visible: true) }
        let(:page_3)       { create(:alchemy_page, visible: true) }
        let(:page_item_1)  { {id: page_1.id, slug: page_1.slug, restricted: false, external: page_1.redirects_to_external?, visible: page_1.visible?, children: [page_item_2]} }
        let(:page_item_2)  { {id: page_2.id, slug: page_2.slug, restricted: false, external: page_2.redirects_to_external?, visible: page_2.visible?, children: [page_item_3]} }
        let(:page_item_3)  { {id: page_3.id, slug: page_3.slug, restricted: false, external: page_3.redirects_to_external?, visible: page_3.visible? } }
        let(:set_of_pages) { [page_item_1] }

        it "stores the new order" 


        context 'with url nesting enabled' do
          before do
            stub_alchemy_config(:url_nesting, true)
          end

          it "updates the pages urlnames" 


          context 'with invisible page in tree' do
            let(:page_item_2) do
              {
                id: page_2.id,
                slug: page_2.slug,
                children: [page_item_3],
                visible: false
              }
            end

            it "does not use this pages slug in urlnames of descendants" 

          end

          context 'with external page in tree' do
            let(:page_item_2) do
              {
                id: page_2.id,
                slug: page_2.slug,
                children: [page_item_3],
                external: true
              }
            end

            it "does not use this pages slug in urlnames of descendants" 

          end

          context 'with restricted page in tree' do
            let(:page_2) { create(:alchemy_page, restricted: true) }
            let(:page_item_2) do
              {
                id: page_2.id,
                slug: page_2.slug,
                children: [page_item_3],
                restricted: true
              }
            end

            it "updates restricted status of descendants" 

          end

          context 'with page having number as slug' do
            let(:page_item_2) do
              {
                id: page_2.id,
                slug: 42,
                children: [page_item_3]
              }
            end

            it "does not raise error" 


            it "still generates the correct urlname on page_3" 

          end

          it "creates legacy urls" 

        end
      end

      describe "#configure" do
        context "with page having nested urlname" do
          let(:page) { create(:alchemy_page, name: 'Foobar', urlname: 'foobar') }

          it "should always show the slug" 

        end
      end

      describe '#create' do
        subject { post admin_pages_path(page: page_params) }

        let(:parent) { create(:alchemy_page) }

        let(:page_params) do
          {
            parent_id: parent.id,
            name: 'new Page',
            page_layout: 'standard'
          }
        end

        context "a new page" do
          it "is nested under given parent" 


          it "redirects to edit page template" 


          context "if new page can not be saved" do
            let(:page_params) do
              {
                parent_id: parent.id,
                name: 'new Page'
              }
            end

            it "renders the create form" 

          end

          context "with redirect_to in params" do
            subject do
              post admin_pages_path(page: page_params, redirect_to: admin_pictures_path)
            end

            it "should redirect to given url" 


            context "when a new page cannot be created" do
              let(:page_params) do
                {
                  parent_id: parent.id,
                  name: 'new Page'
                }
              end

              it "should render the `new` template" 

            end
          end

          context 'with page redirecting to external' do
            let(:page_params) do
              {
                parent_id: parent.id,
                name: 'Google',
                page_layout: 'external'
              }
            end

            it "redirects to sitemap" 

          end

          context 'if page is scoped' do
            context 'user role does not match' do
              before do
                allow_any_instance_of(Page).to receive(:editable_by?).with(user).and_return(false)
              end

              it 'redirects to admin pages path' 

            end
          end
        end

        context "with paste_from_clipboard in parameters" do
          let(:page_in_clipboard) { create(:alchemy_page) }

          it "should call Page#copy_and_paste" 

        end
      end

      describe '#copy_language_tree' do
        let(:params)                     { {languages: {new_lang_id: '2', old_lang_id: '1'}} }
        let(:language_root_to_copy_from) { build_stubbed(:alchemy_page, :language_root) }
        let(:copy_of_language_root)      { build_stubbed(:alchemy_page, :language_root) }
        let(:root_page)                  { mock_model('Page') }

        before do
          allow(Page).to receive(:copy).and_return(copy_of_language_root)
          allow(Page).to receive(:root).and_return(root_page)
          allow(Page).to receive(:language_root_for).and_return(language_root_to_copy_from)
          allow_any_instance_of(Page).to receive(:move_to_child_of)
          allow_any_instance_of(Page).to receive(:copy_children_to)
          allow(Language).to receive(:current).and_return(mock_model('Language', locale: 'de', code: 'de'))
        end

        it "should copy the language root page over to the other language" 


        it "should move the newly created language-root-page below the absolute root page" 


        it "should copy all childs of the original page over to the new created one" 


        it "should redirect to admin_pages_path" 

      end

      describe '#edit' do
        let!(:page)       { create(:alchemy_page) }
        let!(:other_user) { create(:alchemy_dummy_user, :as_author) }

        context 'if page is locked by another user' do
          before { page.lock_to!(other_user) }

          context 'that is signed in' do
            before do
              expect_any_instance_of(DummyUser).to receive(:logged_in?).and_return(true)
            end

            it 'redirects to sitemap' 

          end

          context 'that is not signed in' do
            before do
              expect_any_instance_of(DummyUser).to receive(:logged_in?).and_return(false)
            end

            it 'renders the edit view' 

          end
        end

        context 'if page is locked by myself' do
          before do
            expect_any_instance_of(Page).to receive(:locker).at_least(:once) { user }
            expect(user).to receive(:logged_in?).and_return(true)
          end

          it 'renders the edit view' 


          it 'does not lock the page again' 

        end

        context 'if page is not locked' do
          before do
            expect_any_instance_of(Page).to receive(:locker).at_least(:once) { nil }
          end

          it 'renders the edit view' 


          it "lockes the page to myself" 

        end

        context 'if page is scoped' do
          context 'to a single role' do
            context 'user role matches' do
              before do
                expect_any_instance_of(Page).to receive(:editable_by?).at_least(:once) { true }
              end

              it 'renders the edit view' 

            end

            context 'user role does not match' do
              before do
                expect_any_instance_of(Page).to receive(:editable_by?).at_least(:once) { false }
              end

              it 'redirects to admin dashboard' 

            end
          end
        end
      end

      describe '#destroy' do
        let(:clipboard) { [{'id' => page.id.to_s}] }
        let(:page) { create(:alchemy_page, :public) }

        before do
          allow_any_instance_of(described_class).to receive(:get_clipboard).with('pages') do
            clipboard
          end
        end

        it "should also remove the page from clipboard" 

      end

      describe '#publish' do
        let(:page) { create(:alchemy_page, published_at: 3.days.ago) }

        it "should publish the page" 

      end

      describe '#visit' do
        subject do
          post visit_admin_page_path(page)
        end

        let(:page) { create(:alchemy_page, urlname: 'home', site: site) }

        context "when the pages site is a catch-all" do
          let(:site) { create(:alchemy_site, host: "*") }

          it "should redirect to the page path" 

        end

        context "when pages site is a real host" do
          let(:site) { create(:alchemy_site, host: "reallygoodsite.com") }

          it "should redirect to the page path on that host" 

        end
      end

      describe '#fold' do
        let(:page) { mock_model(Alchemy::Page) }

        before do
          allow(Page).to receive(:find).and_return(page)
          allow(page).to receive(:editable_by?).with(user).and_return(true)
        end

        context "if page is currently not folded" do
          before { allow(page).to receive(:folded?).and_return(false) }

          it "should fold the page" 

        end

        context "if page is already folded" do
          before { allow(page).to receive(:folded?).and_return(true) }

          it "should unfold the page" 

        end
      end

      describe '#unlock' do
        subject { post unlock_admin_page_path(page), xhr: true }

        let(:page) { mock_model(Alchemy::Page, name: 'Best practices') }

        before do
          allow(Page).to receive(:find).with(page.id.to_s).and_return(page)
          allow(page).to receive(:editable_by?).with(user).and_return(true)
          allow(Page).to receive(:from_current_site).and_return(double(locked_by: nil))
          expect(page).to receive(:unlock!) { true }
        end

        it "should unlock the page" 


        context 'requesting for html format' do
          subject { post unlock_admin_page_path(page) }

          it "should redirect to admin_pages_path" 


          context 'if passing :redirect_to through params' do
            subject { post unlock_admin_page_path(page, redirect_to: 'this/path') }

            it "should redirect to the given path" 

          end
        end
      end

      describe "#switch_language" do
        subject(:switch_language) do
          get switch_language_admin_pages_path(language_id: language.id)
        end

        let(:language) { build_stubbed(:alchemy_language, :klingon) }

        before do
          allow(Language).to receive(:find_by).and_return(language)
        end

        it "should store the current language in session" 


        it "should redirect to sitemap" 


        context "coming from layoutpages" do
          before do
            allow_any_instance_of(ActionDispatch::Request).to receive(:referer) do
              'admin/layoutpages'
            end
          end

          it "should redirect to layoutpages" 

        end
      end
    end
  end
end

