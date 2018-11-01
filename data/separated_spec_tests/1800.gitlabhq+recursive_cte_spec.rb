require 'spec_helper'

describe Gitlab::SQL::RecursiveCTE, :postgresql do
  let(:cte) { described_class.new(:cte_name) }

  describe '#to_arel' do
    it 'generates an Arel relation for the CTE body' 

  end

  describe '#alias_to' do
    it 'returns an alias for the CTE' 

  end

  describe '#apply_to' do
    it 'applies a CTE to an ActiveRecord::Relation' 

  end
end

