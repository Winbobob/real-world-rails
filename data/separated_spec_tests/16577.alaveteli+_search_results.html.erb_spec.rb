# -*- encoding : utf-8 -*-
require 'spec_helper'

describe '_search_results.html.erb' do
  let(:draft_batch_request) { AlaveteliPro::DraftInfoRequestBatch.new() }

  def render_view(locals)
    render(:partial => "alaveteli_pro/batch_request_authority_searches/search_results",
           :locals => locals)
  end

  describe "when a search has been performed" do
    let!(:authority_1) { FactoryBot.create(:public_body) }
    let!(:authority_2) { FactoryBot.create(:public_body) }
    let!(:authority_3) { FactoryBot.create(:public_body) }

    before do
      update_xapian_index
      allow(view).to receive(:mode)
      allow(view).to receive(:category_tag)
    end

    describe "and there are some results" do
      let(:search) { ActsAsXapian::Search.new([PublicBody], authority_1.name, :limit => 3 ) }

      it "renders search results" 

    end

    describe 'and there are no results' do
      let(:query) { 'serach term' }
      let(:search) { ActsAsXapian::Search.new([PublicBody], query, limit: 3) }

      it 'renders a no results message' 

    end
  end

  describe "when no search has been performed" do
    it "renders nothing" 

  end
end

