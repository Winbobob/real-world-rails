# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Import::DatabaseHelpers do
  let(:database_helper) do
    Class.new do
      include Gitlab::Import::DatabaseHelpers
    end
  end

  subject { database_helper.new }

  describe '.insert_and_return_id' do
    let(:attributes) { { iid: 1, title: 'foo' } }
    let(:project) { create(:project) }

    context 'on PostgreSQL' do
      it 'returns the ID returned by the query' 

    end

    context 'on MySQL' do
      it 'uses a separate query to retrieve the ID' 

    end
  end
end

