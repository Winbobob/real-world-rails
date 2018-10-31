require 'spec_helper'

describe Gitlab::Database::Count do
  before do
    create_list(:project, 3)
    create(:identity)
  end

  let(:models) { [Project, Identity] }

  describe '.approximate_counts' do
    context 'with MySQL' do
      context 'when reltuples have not been updated' do
        it 'counts all models the normal way' 

      end
    end

    context 'with PostgreSQL', :postgresql do
      describe 'when reltuples have not been updated' do
        it 'counts all models the normal way' 

      end

      describe 'no permission' do
        it 'falls back to standard query' 

      end

      describe 'when some reltuples have been updated' do
        it 'counts projects in the fast way' 

      end

      describe 'when all reltuples have been updated' do
        before do
          ActiveRecord::Base.connection.execute('ANALYZE projects')
          ActiveRecord::Base.connection.execute('ANALYZE identities')
        end

        it 'counts models with the standard way' 

      end
    end
  end
end

