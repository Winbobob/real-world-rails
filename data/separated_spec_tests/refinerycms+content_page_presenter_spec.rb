require "spec_helper"

module Refinery
  module Pages
    describe ContentPagePresenter do
      let(:part)  { double(PagePart, :body => 'part_body', :slug => 'a_wonderful_page_part', :title => 'A Wonderful Page Part') }
      let(:part2) { double(PagePart, :body => 'part_body2', :slug => 'a_wonderful_page_part', :title => 'Another Wonderful Page Part') }
      let(:title) { 'This Great Page' }

      describe "when building for page" do
        let(:page_with_one_part) { double(Page, :parts => [part]) }

        it "adds page title section before page parts" 


        it "adds a section for each page part" 


        it "adds body content left and right after page parts" 


        it "doesnt add page parts if page is nil" 


        it "doesnt add title if it is blank" 

      end
    end
  end
end

