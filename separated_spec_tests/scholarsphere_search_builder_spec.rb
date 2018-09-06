# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchBuilder do
  let(:context) { double }
  let(:builder) { described_class.new(context).with(blacklight_params) }
  let(:solr_params) { Blacklight::Solr::Request.new }
  let(:blacklight_params) { { q: user_query, search_field: 'all_fields' } }
  let(:user_query) { 'find me' }

  describe '#show_works_or_works_that_contain_files' do
    subject { builder.show_works_or_works_that_contain_files(solr_params) }

    context 'with a user query' do
      it 'creates a valid solr join for works and files' 

    end

    context 'without a user query' do
      let(:blacklight_params) { {} }

      it 'does not modify the query' 

    end

    context 'when doing a fielded search' do
      let(:blacklight_params) { { q: user_query, search_field: 'depositor' } }
      # Blacklight sets up these values when we've done a fielded search.
      # Here we're ensuring they aren't wiped out
      let(:solr_params) { Blacklight::Solr::Request.new('q' => "{!qf=depositor_ssim pf=depositor_ssim}\"#{user_query}\"") }

      it 'does not modify the query' 

    end
  end
end

