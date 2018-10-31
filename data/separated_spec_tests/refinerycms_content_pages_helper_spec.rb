require 'spec_helper'

module Refinery
  module Pages
    describe ContentPagesHelper, :type => :helper do
      let(:content_presenter) { double(ContentPresenter, :hide_sections => nil, :fetch_template_overrides => nil, :to_html => nil) }

      describe "when rendering content presenter" do
        it "asks to content presenter to hide sections if told to" 


        it "attempts to fetch template overrides declared elsewhere via content_for" 


        it "outputs the html rendered by the content presenter" 


        it "passes can_use_fallback option through to html rendering" 

      end

      describe "when rendering page" do
        let(:page) { double(Page) }

        it "builds a content page presenter and returns its html" 

      end
    end
  end
end

