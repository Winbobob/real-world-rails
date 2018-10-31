# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/ores_api"

describe OresApi do
  context 'when the wiki is not a wikipedia' do
    before { stub_wiki_validation }
    let!(:wiki) { create(:wiki, project: 'wikivoyage', language: 'en') }
    let(:subject) { described_class.new(wiki) }
    it 'raises an error' 

  end

  describe '#get_revision_data' do
    let(:rev_id) { 641962088 }
    let(:subject) { described_class.new(Wiki.find(1)).get_revision_data(rev_id) }
    it 'fetches json from ores.wikimedia.org' 

  end
end

