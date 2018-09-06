require "spec_helper"

module Refinery
  module Admin
    describe PagesHelper, :type => :helper do
      describe "#template_options" do
        context "when page layout/view template is set" do
          it "returns those templates as selected" 

        end

        context "when page layout template is set using symbols" do
          before do
            allow(Pages.config).to receive(:layout_template_whitelist).and_return [:three, :one, :two]
          end

          it "works as expected" 

        end

        context "when page layout template isn't set" do
          context "when page has parent and parent has layout_template set" do
            it "returns parent layout_template as selected" 

          end

          context "when page doesn't have parent page" do
            it "returns default application template" 

          end
        end
      end

      describe "#page_meta_information" do
        let(:page) { FactoryBot.build(:page) }

        context "when show_in_menu is false" do
          it "adds 'hidden' label" 

        end

        context "when skip_to_first_child is true" do
          it "adds 'skip to first child' label" 

        end

        context "when link_url is present" do
          it "adds 'redirected' label" 

        end

        context "when draft is true" do
          it "adds 'draft' label" 

        end
      end
    end
  end
end

