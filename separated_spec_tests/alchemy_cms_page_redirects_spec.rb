# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe 'Requesting a page' do
    let!(:default_language) { Language.default }

    let!(:default_language_root) do
      create(:alchemy_page, :language_root, language: default_language, name: 'Home')
    end

    let(:public_page) do
      create(:alchemy_page, :public, visible: true, name: 'Page 1')
    end

    let(:public_child) do
      create(:alchemy_page, :public, name: 'Public Child', parent_id: public_page.id)
    end

    context "in multi language mode" do
      let(:second_page) { create(:alchemy_page, :public, name: 'Second Page') }

      let(:legacy_url) do
        LegacyPageUrl.create(
          urlname: 'index.php?option=com_content&view=article&id=48&Itemid=69',
          page: second_page
        )
      end

      before do
        allow_any_instance_of(PagesController).to receive(:multi_language?).and_return(true)
      end

      context 'if language params are given' do
        context "and page locale is default locale" do
          it "redirects to unprefixed locale url" 

        end

        context "and page locale is not default locale" do
          it "does not redirect" 

        end
      end

      context 'if no language params are given' do
        context "and page locale is default locale" do
          it "doesn't prepend the url with the locale string" 


          it "redirects legacy url with unknown format & query string without locale prefix" 

        end

        context "and page locale is not default locale" do
          before do
            allow(::I18n).to receive(:default_locale).and_return(:de)
          end

          it "redirects to url with the locale prefixed" 


          it "redirects legacy url with unknown format & query string with locale prefix" 

        end
      end

      context "if requested page is unpublished" do
        before do
          public_page.update_attributes(
            public_on: nil,
            visible: false,
            name: 'Not Public',
            urlname: ''
          )
          public_child
        end

        it "redirects to public child" 


        context "with only unpublished pages in page tree" do
          before do
            public_child.update_attributes(public_on: nil)
          end

          it "should raise not found error" 

        end

        context "if page locale is the default locale" do
          it "redirects to public child with prefixed locale" 

        end
      end

      context "if requested url is the index url" do
        context 'and redirect_to_public_child is enabled' do
          before do
            allow(Config).to receive(:get) do |arg|
              arg == :redirect_to_public_child ? true : Config.parameter(arg)
            end
          end

          context "if index page is unpublished" do
            let!(:public_child) do
              create(:alchemy_page, :public, name: 'Public Child', parent_id: default_language_root.id)
            end

            before do
              default_language_root.update(
                public_on: nil,
                visible: false,
                name: 'Not Public',
                urlname: ''
              )
            end

            context "and index page locale is default locale" do
              it 'redirects to public child without prefixed locale' 

            end

            context "and page locale is not default locale" do
              before do
                allow(::I18n).to receive(:default_locale).and_return(:de)
              end

              it 'redirects to public child with prefixed locale' 

            end
          end
        end
      end

      context "if requested url is only the language code" do
        context "if requested locale is the default locale" do
          before do
            allow(::I18n).to receive(:default_locale) { default_language.code }
          end

          it "redirects to '/'" 

        end

        context "if page locale is not the default locale" do
          before do
            allow(::I18n).to receive(:default_locale) { :de }
          end

          it "does not redirect" 

        end
      end

      it "should keep additional params" 


      context "wrong language requested" do
        before do
          allow(Alchemy.user_class).to receive(:admins).and_return([1, 2])
        end

        it "should render 404 if urlname and lang parameter do not belong to same page" 


        it "should render 404 if requested language does not exist" 

      end
    end

    context "not in multi language mode" do
      let(:second_page) { create(:alchemy_page, :public, name: 'Second Page') }

      let(:legacy_url) do
        LegacyPageUrl.create(
          urlname: 'index.php?option=com_content&view=article&id=48&Itemid=69',
          page: second_page
        )
      end

      before do
        allow_any_instance_of(PagesController).to receive(:multi_language?).and_return(false)
      end

      it "redirects legacy url with unknown format & query string" 


      it "redirects from nested language code url to normal url" 


      context "redirects to public child" do
        before do
          public_page.update_attributes(
            visible: false,
            public_on: nil,
            name: 'Not Public',
            urlname: ''
          )
          public_child
        end

        it "if requested page is unpublished" 


        it "with normal url, if requested url has nested language code and is not public" 

      end

      context 'if requested url is index url' do
        context "when locale is prefixed" do
          it "redirects to normal url" 

        end
      end

      it "should keep additional params" 

    end
  end
end

