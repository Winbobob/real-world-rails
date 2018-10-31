require 'spec_helper'

describe Gitlab::SQL::Union do
  let(:relation_1) { User.where(email: 'alice@example.com').select(:id) }
  let(:relation_2) { User.where(email: 'bob@example.com').select(:id) }

  def to_sql(relation)
    relation.reorder(nil).to_sql
  end

  describe '#to_sql' do
    it 'returns a String joining relations together using a UNION' 


    it 'skips Model.none segements' 


    it 'uses UNION ALL when removing duplicates is disabled' 


    it 'returns `NULL` if all relations are empty' 

  end
end

