# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountRelationshipsPresenter do
  describe '.initialize' do
    before do
      allow(Account).to receive(:following_map).with(account_ids, current_account_id).and_return(default_map)
      allow(Account).to receive(:followed_by_map).with(account_ids, current_account_id).and_return(default_map)
      allow(Account).to receive(:blocking_map).with(account_ids, current_account_id).and_return(default_map)
      allow(Account).to receive(:muting_map).with(account_ids, current_account_id).and_return(default_map)
      allow(Account).to receive(:requested_map).with(account_ids, current_account_id).and_return(default_map)
      allow(Account).to receive(:domain_blocking_map).with(account_ids, current_account_id).and_return(default_map)
    end

    let(:presenter)          { AccountRelationshipsPresenter.new(account_ids, current_account_id, options) }
    let(:current_account_id) { Fabricate(:account).id }
    let(:account_ids)        { [Fabricate(:account).id] }
    let(:default_map)        { { 1 => true } }

    context 'options are not set' do
      let(:options) { {} }

      it 'sets default maps' 

    end

    context 'options[:following_map] is set' do
      let(:options) { { following_map: { 2 => true } } }

      it 'sets @following merged with default_map and options[:following_map]' 

    end

    context 'options[:followed_by_map] is set' do
      let(:options) { { followed_by_map: { 3 => true } } }

      it 'sets @followed_by merged with default_map and options[:followed_by_map]' 

    end

    context 'options[:blocking_map] is set' do
      let(:options) { { blocking_map: { 4 => true } } }

      it 'sets @blocking merged with default_map and options[:blocking_map]' 

    end

    context 'options[:muting_map] is set' do
      let(:options) { { muting_map: { 5 => true } } }

      it 'sets @muting merged with default_map and options[:muting_map]' 

    end

    context 'options[:requested_map] is set' do
      let(:options) { { requested_map: { 6 => true } } }

      it 'sets @requested merged with default_map and options[:requested_map]' 

    end

    context 'options[:domain_blocking_map] is set' do
      let(:options) { { domain_blocking_map: { 7 => true } } }

      it 'sets @domain_blocking merged with default_map and options[:domain_blocking_map]' 

    end
  end
end

