# frozen_string_literal: true

require 'rails_helper'

describe CollectionIndexer do
  describe 'fontawesome default icon' do
    let(:collection) { build(:collection, id: '1234') }
    let(:solr_doc) { described_class.new(collection).generate_solr_document }

    it 'indexes thumbnail' 

  end
end

