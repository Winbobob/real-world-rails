# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Competitions list" do
  context "list view" do
    context "when a delegate is set in the params" do
      let(:competition) { FactoryBot.create :competition, :visible, :future }
      let(:delegate) { competition.delegates.first }

      before { visit "/competitions?delegate=#{delegate.id}" }

      it "the delegate is selected within the form", js: true do
        expect(page.find("#competition-query-form #delegate")).to have_text(delegate.name)
      end

      it "only competitions delegated by the given delegate are shown" 

    end
  end

  context "admin view" do
    before :each do
      sign_in FactoryBot.create(:admin)
    end

    it 'renders finished competition without results' 

  end
end

