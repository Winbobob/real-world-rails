# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe "Page creation" do
    before { authorize_user(:as_admin) }

    describe "overlay GUI" do
      context "without having a Page in the clipboard" do
        it "does not contain tabs" 

      end

      context "when having a Page in the clipboard" do
        before do
          expect(Page).to receive(:all_from_clipboard_for_select).and_return [build_stubbed(:alchemy_page)]
        end

        it "contains tabs for creating a new page and pasting from clipboard" 


        context "", js: true do
          let(:root_page) { Alchemy::Page.last }

          before do
            visit admin_pages_path
            page.find("a[href='#{new_admin_page_path(parent_id: root_page.id)}']").click
          end

          it "the create page tab is visible by default" 


          context "when clicking on an inactive tab" do
            it "shows that clicked tab" 

          end
        end
      end
    end
  end
end

