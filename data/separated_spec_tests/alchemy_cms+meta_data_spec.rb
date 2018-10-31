# frozen_string_literal: true

require 'spec_helper'
module Alchemy
  describe 'alchemy/pages/_meta_data' do
    let(:root_page)       { Page.new }
    let(:page)            { Page.new(language_code: "en", title: "Road Runner", urlname: "roadrunner") }
    let(:title_prefix)    { "" }
    let(:title_suffix)    { "" }
    let(:title_separator) { "" }

    subject do
      render "alchemy/pages/meta_data", title_prefix: title_prefix, title_suffix: title_suffix, title_separator: title_separator
    end

    context "when current page is set" do
      before { view.instance_variable_set('@page', page) }

      describe "meta keywords" do
        context "are set" do
          before { allow(page).to receive_messages(meta_keywords: 'cartoon, road runner') }

          it "renders the keywords in the correct meta tag" 

        end

        context "are not set" do
          before { allow(Language).to receive(:current_root_page).and_return(root_page) }

          context "but the language root page has meta keywords" do
            before { root_page.meta_keywords = "keywords, language, root" }

            it "renders its keywords in the correct meta tag" 

          end

          context "and the language root page is also missing meta keywords" do
            it "does not render the meta keywords tag" 

          end
        end
      end

      describe "meta description" do
        context "is set" do
          before { allow(page).to receive_messages(meta_description: 'road runner goes meep meep') }

          it "renders the description in the correct meta tag" 

        end

        context "is not set" do
          before { allow(Language).to receive(:current_root_page).and_return(root_page) }

          context "but the language root page has a meta description" do
            before { root_page.meta_description = "description from language root" }

            it "renders its description in the correct meta tag" 

          end

          context "and the language root page is also missing a meta description" do
            it "does not render the meta description tag" 

          end
        end
      end

      describe "rss feed" do
        context "is provided" do
          before do
            allow(page).to receive_messages(contains_feed?: true)
            allow(view).to receive_messages(prefix_locale?: false)
          end

          it "renders a link to the feed" 

        end

        context "is not provided" do
          it "does not render a feed link" 

        end
      end

      describe "title" do
        it "renders the title tag for the current page" 


        context "with a given prefix and separator" do
          let(:title_prefix)    { "C64" }
          let(:title_separator) { " - " }

          it "renders the prefixed title" 

        end

        context "with a given suffix and separator" do
          let(:title_suffix)    { "C64" }
          let(:title_separator) { " - " }

          it "renders the suffixed title" 

        end

        context "with a given prefix, suffix and separator" do
          let(:title_prefix)    { "C64" }
          let(:title_suffix)    { "Platform game" }
          let(:title_separator) { " - " }

          it "renders the suffixed title" 

        end
      end

      describe "meta robots" do
        context "when robots may index" do
          it "renders 'index'" 


          context "and robots may follow the links" do
            it "renders 'follow'" 

          end

          context "and robots are not allowed to follow links" do
            before { allow(page).to receive_messages(robot_follow?: false) }

            it "renders 'nofollow'" 

          end
        end

        context "when robots are not allowed to index" do
          before { allow(page).to receive_messages(robot_index?: false) }

          it "renders 'noindex'" 


          context "and robots may follow the links" do
            it "renders 'follow'" 

          end
          context "and robots are not allowed to follow links" do
            before { allow(page).to receive_messages(robot_follow?: false) }

            it "renders 'nofollow'" 

          end
        end
      end
    end

    context "when current page is not set" do
      it "renders nothing" 

    end
  end
end

