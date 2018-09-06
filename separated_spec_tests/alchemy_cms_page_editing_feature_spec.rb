# frozen_string_literal: true

require 'spec_helper'

describe 'Page editing feature' do
  let(:a_page) { create(:alchemy_page) }

  context 'as author' do
    before { authorize_user(:as_author) }

    it 'cannot publish page.' 


    describe "the preview frame", :js do
      it "has relative url" 

    end
  end

  context 'as editor' do
    before { authorize_user(:as_editor) }

    it 'can publish page.' 


    context 'while editing a global page' do
      let(:a_page) { create(:alchemy_page, layoutpage: true) }

      it 'can publish page.' 

    end
  end

  context 'as admin' do
    let(:a_page) { create(:alchemy_page, :public, visible: true) }

    before { authorize_user(:as_admin) }

    context "in configure overlay" do
      context "when editing a normal page" do
        it "should show all relevant input fields" 


        context "with sitemaps show_flag config option set to true" do
          before do
            stub_alchemy_config(:sitemap, {'show_flag' => true})
          end

          it "should show sitemap checkbox" 

        end

        context "with sitemaps show_flag config option set to false" do
          before do
            stub_alchemy_config(:sitemap, {'show_flag' => false})
          end

          it "should not show sitemap checkbox" 

        end
      end

      context "when editing a global page" do
        let(:layout_page) { create(:alchemy_page, layoutpage: true) }

        it "should not show the input fields for normal pages" 

      end

      context "when page is taggable" do
        before do
          expect_any_instance_of(Alchemy::Page)
            .to receive(:taggable?).and_return(true)
        end

        it "should show the tag_list input field" 

      end
    end

    context "in preview frame" do
      it "the menubar does not render on the page" 


      it "navigation links are not clickable" 

    end

    context 'in element panel' do
      let!(:everything_page) do
        create(:alchemy_page, page_layout: 'everything', do_not_autogenerate: false)
      end

      it "renders essence editors for all elements" 

    end
  end

  describe "configure properties", js: true do
    before { authorize_user(:as_admin) }
    let!(:a_page) { create(:alchemy_page) }

    context "when updating the name" do
      it "saves the name" 

    end
  end

  describe "fixed attributes" do
    before { authorize_user(:as_author) }

    context "when page has fixed attributes" do
      let!(:readonly_page) do
        create(:alchemy_page, page_layout: 'readonly')
      end

      it 'is not possible to edit the attribute', :aggregate_failures do
        visit alchemy.configure_admin_page_path(readonly_page)
        readonly_page.fixed_attributes.all.each do |attribute, _v|
          expect(page).to have_selector("#page_#{attribute}[disabled=\"disabled\"]")
        end
      end
    end
  end
end

