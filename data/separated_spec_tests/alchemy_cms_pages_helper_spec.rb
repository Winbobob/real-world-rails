# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe PagesHelper do
    # Fixtures
    let(:language)                 { mock_model('Language', code: 'en') }
    let(:default_language)         { Language.default }
    let(:language_root)            { create(:alchemy_page, :language_root) }
    let(:public_page)              { create(:alchemy_page, :public) }
    let(:visible_page)             { create(:alchemy_page, :public, visible: true) }
    let(:restricted_page)          { create(:alchemy_page, :public, visible: true, restricted: true) }
    let(:level_2_page)             { create(:alchemy_page, :public, parent_id: visible_page.id, visible: true, name: 'Level 2') }
    let(:level_3_page)             { create(:alchemy_page, :public, parent_id: level_2_page.id, visible: true, name: 'Level 3') }
    let(:level_4_page)             { create(:alchemy_page, :public, parent_id: level_3_page.id, visible: true, name: 'Level 4') }
    let(:klingon)                  { create(:alchemy_language, :klingon) }
    let(:klingon_language_root)    { create(:alchemy_page, :language_root, language: klingon) }
    let(:klingon_public_page)      { create(:alchemy_page, :public, language: klingon, parent_id: klingon_language_root.id) }

    before do
      helper.controller.class_eval { include Alchemy::ConfigurationMethods }
      allow(Config).to receive(:get) { |arg| arg == :url_nesting ? true : Config.parameter(arg) }
      @root_page = language_root # We need this instance variable in the helpers
    end

    describe "#render_page_layout" do
      it "should render the current page layout" 

    end

    describe '#render_site_layout' do
      let(:default_site) { Alchemy::Site.default }

      it "renders the partial for current site" 


      context "with missing partial" do
        it "returns empty string and logges warning" 

      end
    end

    describe "#render_navigation" do
      let(:user) { nil }

      before do
        visible_page
        allow(helper).to receive(:current_ability).and_return(Alchemy::Permissions.new(user))
      end

      it "should render only visible pages" 


      it "should render visible unpublished pages" 


      context "not in multi_language mode" do
        before { allow(helper).to receive(:multi_language?).and_return(false) }

        it "should render the page navigation" 


        context "as guest user" do
          before { restricted_page }

          it "should not render restricted pages" 

        end

        context "as member user" do
          let(:user) { build(:alchemy_dummy_user) }

          before { restricted_page }

          it "should render also restricted pages" 

        end

        context "with enabled url nesting" do
          before do
            allow(helper).to receive(:configuration).and_return(true)
            level_3_page
          end

          it "should render nested page links" 

        end
      end

      context "when passing html options" do
        it "should append all given attributes to the generated ul tag" 


        context "when overriding the `class` attribute" do
          it "should replace the default css classes from the generated ul tag" 

        end
      end

      context "with options[:deepness] set" do
        before { level_3_page }

        it "shows only pages up to this depth" 

      end

      context "with options[:spacer] set" do
        before { visible_page }

        context "with two pages on same level" do
          before { create(:alchemy_page, :public, visible: true) }

          it "should render the given spacer" 

        end

        context "only one page in current level" do
          it "should not render the spacer" 

        end
      end

      context "with options[:from_page] set" do
        before { level_2_page }

        context "passing a page object" do
          it "should render the pages underneath the given one" 

        end

        context "passing a page_layout" do
          it "should render the pages underneath the page with the given page_layout" 

        end

        context "passing a page_layout of a not existing page" do
          it "should render nothing" 

        end
      end
    end

    describe '#render_subnavigation' do
      let(:user) { nil }

      before {
        allow(helper).to receive(:multi_language?).and_return(false)
        allow(helper).to receive(:current_ability).and_return(Alchemy::Permissions.new(user))
      }

      it "should return nil if no @page is set" 


      context "showing a page with level 2" do
        before { @page = level_2_page }

        it "should render the navigation from current page" 


        it "should set current page active" 

      end

      context "showing a page with level 3" do
        before { @page = level_3_page }

        it "should render the navigation from current pages parent" 


        it "should set current page active" 

      end

      context "showing a page with level 4" do
        before { @page = level_4_page }

        it "should render the navigation from current pages parents parent" 


        it "should set current page active" 


        context "beginning with level 3" do
          it "should render the navigation beginning from its parent" 

        end
      end
    end

    describe "#render_breadcrumb" do
      let(:parent) { create(:alchemy_page, :public, visible: true) }
      let(:page)   { create(:alchemy_page, :public, parent_id: parent.id, visible: true) }
      let(:user)   { nil }

      before do
        allow(helper).to receive(:multi_language?).and_return(false)
        allow(helper).to receive(:current_ability).and_return(Alchemy::Permissions.new(user))
      end

      it "should render a breadcrumb to current page" 


      context "with options[:separator] given" do
        it "should render a breadcrumb with an alternative separator" 

      end

      context "with options[:reverse] set to true" do
        it "should render a breadcrumb in reversed order" 

      end

      context "with options[:restricted_only] set to true" do
        let(:user) { build(:alchemy_dummy_user) }

        it "should render a breadcrumb of restricted pages only" 

      end

      it "should render a breadcrumb of visible pages only" 


      it "should render a breadcrumb of visible and unpublished pages" 


      context "with options[:without]" do
        it "should render a breadcrumb without this page" 

      end

      context "with options[:without] as array" do
        it "should render a breadcrumb without these pages." 

      end
    end

    describe "#language_links" do
      context "with another site, root page and language present" do
        let!(:second_site) { create(:alchemy_site, name: "Other", host: "example.com") }
        let!(:language_root_2) { create(:alchemy_page, :language_root, name: "Intro", language: klingon_2) }
        let!(:public_page_2) { create(:alchemy_page, :public, language: klingon_2) }
        let!(:klingon_2) { create(:alchemy_language, :klingon, site: second_site) }

        before { klingon_language_root }

        it 'should still only render two links' 

      end

      context "with two public languages on the same site" do
        # Always create second language
        before { klingon }

        context "with only one language root page" do
          it "should return nil" 

        end

        context "with two language root pages" do
          # Always create a language root page for klingon
          before { klingon_language_root }

          it "should render two language links" 


          it "should render language links referring to their language root page" 


          context "with options[:linkname]" do
            context "set to 'name'" do
              it "should render the name of the language" 

            end

            context "set to 'code'" do
              it "should render the code of the language" 

            end
          end

          context "spacer set to '\o/'" do
            it "should render the given string as a spacer" 

          end

          context "with options[:reverse]" do
            context "set to false" do
              it "should render the language links in an ascending order" 

            end

            context "set to true" do
              it "should render the language links in a descending order" 

            end
          end

          context "with options[:show_title]" do
            context "set to true" do
              it "should render the language links with titles" 

            end

            context "set to false" do
              it "should render the language links without titles" 

            end
          end
        end
      end
    end

    describe "#cell_empty" do
      let(:cell)    { create(:alchemy_cell, name: 'test_cell', page: public_page) }
      let(:element) { create(:alchemy_element) }

      before { @page = public_page }

      context "with elements" do
        before do
          cell.elements << element
          cell.save!
        end

        it "should return true" 

      end

      context "with zero elements" do
        it "should return true" 

      end

      context "with trashed elements" do
        before do
          cell.elements << element
          cell.save!

          element.trash!
          element.save!
        end

        it "should return true" 

      end
    end

    describe "meta data" do
      before { @page = public_page }

      describe "#meta_description" do
        subject { helper.meta_description }

        context "when current page has a meta description set" do
          before { public_page.meta_description = "description of my public page" }
          it { is_expected.to eq "description of my public page" }
        end

        context "when current page has no meta description set" do
          before do
            language_root.meta_description = "description from language root"
            allow(Language).to receive_messages(current_root_page: language_root)
          end

          context "when #meta_description is an empty string" do
            before { public_page.meta_description = "" }

            it "returns the meta description of its language root page" 

          end

          context "when #meta_description is nil" do
            before { public_page.meta_description = nil }

            it "returns the meta description of its language root page" 

          end
        end
      end

      describe "#meta_keywords" do
        subject { helper.meta_keywords }

        context "when current page has meta keywords set" do
          before { public_page.meta_keywords = "keywords, from public page" }
          it { is_expected.to eq "keywords, from public page" }
        end

        context "when current page has no meta keywords set" do
          before do
            language_root.meta_keywords = "keywords, from language root"
            allow(Language).to receive_messages(current_root_page: language_root)
          end

          context "when #meta_keywords is an empty string" do
            before { public_page.meta_keywords = "" }

            it "returns the keywords of its language root page" 

          end

          context "when #meta_keywords is nil" do
            before { public_page.meta_keywords = nil }

            it "returns the keywords of its language root page" 

          end
        end
      end

      describe "#meta_robots" do
        subject { helper.meta_robots }

        context "when robots may index" do
          it "contains 'index'" 


          context "and robots may follow the links" do
            it "contains 'follow'" 

          end

          context "and robots are not allowed to follow links" do
            before { allow(public_page).to receive_messages(robot_follow?: false) }

            it "contains 'nofollow'" 

          end
        end

        context "when robots are not allowed to index" do
          before { allow(public_page).to receive_messages(robot_index?: false) }

          it "contains 'noindex'" 


          context "and robots may follow the links" do
            it "contains 'follow'" 

          end
          context "and robots are not allowed to follow links" do
            before { allow(public_page).to receive_messages(robot_follow?: false) }

            it "contains 'nofollow'" 

          end
        end
      end
    end

    describe "#picture_essence_caption" do
      let(:essence) { mock_model('EssencePicture', caption: 'my caption') }
      let(:content) { mock_model('Content', essence: essence) }

      it "should return the caption of the contents essence" 

    end
  end
end

