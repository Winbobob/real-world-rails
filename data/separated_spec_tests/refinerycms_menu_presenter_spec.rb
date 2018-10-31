require "spec_helper"

module Refinery
  module Pages
    describe MenuPresenter do
      let!(:original_mounted_path) { Core.mounted_path }
      let(:mounted_path) { "/" }

      before do
        allow(Core).to receive(:mounted_path).and_return(mounted_path)
        Rails.application.reload_routes!
      end

      after do
        allow(Core).to receive(:mounted_path).and_return(original_mounted_path)
        Rails.application.reload_routes!
      end

      let(:menu_presenter) do
        menu_items = []
        allow(menu_items).to receive(:roots)

        MenuPresenter.new(menu_items, view)
      end

      describe "config" do
        it "has default values" 

      end

      describe "#roots" do
        context "when #roots is configured" do
          it "returns config.roots" 

        end

        context "when #roots isn't configured" do
          it "returns roots from passed in collection" 

        end
      end

      describe "#to_html" do
        let(:menu_items) {
          Refinery::Menu.new(FactoryBot.create(:page, :title => "Refinery CMS"))
        }
        let(:menu_presenter) { MenuPresenter.new(menu_items, view) }

        context "wrapped in html" do
          it "returns menu items" 


          context "with role set to navigation" do
            let(:menu_presenter_with_role) {
              menu_presenter.menu_role = 'navigation'
              menu_presenter
            }

            it "returns menu items wrapped in html with role set to navigation" 

          end
        end

        context "takes mount point into account" do
          let(:mounted_path) { "/subfolder"}

          it "for normal pages" 


          context "when page has a link_url" do
            let(:menu_items) {
              Menu.new(FactoryBot.create(:page, title: "Home", link_url: "/"))
            }
            it "the menu item URL includes the mounted path" 

          end
        end
      end

    end
  end
end

