# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe "Page destroy feature", js: true do
    before { authorize_user(:as_admin) }

    context 'destroying a content page' do
      let!(:content_page) { create(:alchemy_page) }

      it "deletes page and redirects to page tree" 

    end

    context 'destroying a layout page' do
      let!(:layout_page) { create(:alchemy_page, :layoutpage) }

      it "deletes page and redirects to page tree" 

    end
  end
end

