require "spec_helper"

module Refinery
  describe TranslatedFieldPresenter do
    let(:page) { FactoryBot.build(:page) }

    before do
      Mobility.with_locale(:en) do
        page.title = "draft"
        page.save!
      end

      Mobility.with_locale(:lv) do
        page.title = "melnraksts"
        page.save!
      end
    end

    describe "#call" do
      context "when title is present" do
        it "returns it" 

      end

      context "when title for current locale isn't available" do
        it "returns existing title from translations" 

      end
    end
  end
end


