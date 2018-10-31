require 'spec_helper'

describe Gitlab::Database::MigrationHelpers do
  let(:model) do
    ActiveRecord::Migration.new.extend(described_class)
  end

  before do
    allow(model).to receive(:puts)
  end

  describe '#add_timestamps_with_timezone' do
    before do
      allow(model).to receive(:transaction_open?).and_return(false)
    end

    context 'using PostgreSQL' do
      before do
        allow(Gitlab::Database).to receive(:postgresql?).and_return(true)
        allow(model).to receive(:disable_statement_timeout)
      end

      it 'adds "created_at" and "updated_at" fields with the "datetime_with_timezone" data type' 

    end

    context 'using MySQL' do
      before do
        allow(Gitlab::Database).to receive(:postgresql?).and_return(false)
      end

      it 'adds "created_at" and "updated_at" fields with "datetime_with_timezone" data type' 

    end
  end

  describe '#add_concurrent_index' do
    context 'outside a transaction' do
      before do
        allow(model).to receive(:transaction_open?).and_return(false)
      end

      context 'using PostgreSQL' do
        before do
          allow(Gitlab::Database).to receive(:postgresql?).and_return(true)
          allow(model).to receive(:disable_statement_timeout)
        end

        it 'creates the index concurrently' 


        it 'creates unique index concurrently' 


        it 'does nothing if the index exists already' 

      end

      context 'using MySQL' do
        before do
          allow(Gitlab::Database).to receive(:postgresql?).and_return(false)
        end

        it 'creates a regular index' 


        it 'does nothing if the index exists already' 

      end
    end

    context 'inside a transaction' do
      it 'raises RuntimeError' 

    end
  end

  describe '#remove_concurrent_index' do
    context 'outside a transaction' do
      before do
        allow(model).to receive(:transaction_open?).and_return(false)
        allow(model).to receive(:index_exists?).and_return(true)
      end

      context 'using PostgreSQL' do
        before do
          allow(model).to receive(:supports_drop_index_concurrently?).and_return(true)
          allow(model).to receive(:disable_statement_timeout)
        end

        describe 'by column name' do
          it 'removes the index concurrently' 


          it 'does nothing if the index does not exist' 

        end

        describe 'by index name' do
          before do
            allow(model).to receive(:index_exists_by_name?).with(:users, "index_x_by_y").and_return(true)
          end

          it 'removes the index concurrently by index name' 


          it 'does nothing if the index does not exist' 

        end
      end

      context 'using MySQL' do
        it 'removes an index' 

      end
    end

    context 'inside a transaction' do
      it 'raises RuntimeError' 

    end
  end

  describe '#add_concurrent_foreign_key' do
    before do
      allow(model).to receive(:foreign_key_exists?).and_return(false)
    end

    context 'inside a transaction' do
      it 'raises an error' 

    end

    context 'outside a transaction' do
      before do
        allow(model).to receive(:transaction_open?).and_return(false)
      end

      context 'using MySQL' do
        before do
          allow(Gitlab::Database).to receive(:mysql?).and_return(true)
        end

        it 'creates a regular foreign key' 


        it 'does not create a foreign key if it exists already' 

      end

      context 'using PostgreSQL' do
        before do
          allow(Gitlab::Database).to receive(:mysql?).and_return(false)
        end

        it 'creates a concurrent foreign key and validates it' 


        it 'appends a valid ON DELETE statement' 


        it 'does not create a foreign key if it exists already' 

      end
    end
  end

  describe '#concurrent_foreign_key_name' do
    it 'returns the name for a foreign key' 

  end

  describe '#foreign_key_exists?' do
    before do
      key = ActiveRecord::ConnectionAdapters::ForeignKeyDefinition.new(:projects, :users, { column: :non_standard_id })
      allow(model).to receive(:foreign_keys).with(:projects).and_return([key])
    end

    it 'finds existing foreign keys by column' 


    it 'finds existing foreign keys by target table only' 


    it 'compares by column name if given' 


    it 'compares by target if no column given' 

  end

  describe '#disable_statement_timeout' do
    context 'using PostgreSQL' do
      it 'disables statement timeouts' 

    end

    context 'using MySQL' do
      it 'does nothing' 

    end
  end

  describe '#true_value' do
    context 'using PostgreSQL' do
      before do
        expect(Gitlab::Database).to receive(:postgresql?).and_return(true)
      end

      it 'returns the appropriate value' 

    end

    context 'using MySQL' do
      before do
        expect(Gitlab::Database).to receive(:postgresql?).and_return(false)
      end

      it 'returns the appropriate value' 

    end
  end

  describe '#false_value' do
    context 'using PostgreSQL' do
      before do
        expect(Gitlab::Database).to receive(:postgresql?).and_return(true)
      end

      it 'returns the appropriate value' 

    end

    context 'using MySQL' do
      before do
        expect(Gitlab::Database).to receive(:postgresql?).and_return(false)
      end

      it 'returns the appropriate value' 

    end
  end

  describe '#update_column_in_batches' do
    context 'when running outside of a transaction' do
      before do
        expect(model).to receive(:transaction_open?).and_return(false)

        create_list(:project, 5)
      end

      it 'updates all the rows in a table' 


      it 'updates boolean values correctly' 


      context 'when a block is supplied' do
        it 'yields an Arel table and query object to the supplied block' 

      end

      context 'when the value is Arel.sql (Arel::Nodes::SqlLiteral)' do
        it 'updates the value as a SQL expression' 

      end
    end

    context 'when running inside the transaction' do
      it 'raises RuntimeError' 

    end
  end

  describe '#add_column_with_default' do
    context 'outside of a transaction' do
      context 'when a column limit is not set' do
        before do
          expect(model).to receive(:transaction_open?)
            .and_return(false)
            .at_least(:once)

          expect(model).to receive(:transaction).and_yield

          expect(model).to receive(:add_column)
            .with(:projects, :foo, :integer, default: nil)

          expect(model).to receive(:change_column_default)
            .with(:projects, :foo, 10)
        end

        it 'adds the column while allowing NULL values' 


        it 'adds the column while not allowing NULL values' 


        it 'removes the added column whenever updating the rows fails' 


        it 'removes the added column whenever changing a column NULL constraint fails' 

      end

      context 'when a column limit is set' do
        it 'adds the column with a limit' 

      end
    end

    context 'inside a transaction' do
      it 'raises RuntimeError' 

    end
  end

  describe '#rename_column_concurrently' do
    context 'in a transaction' do
      it 'raises RuntimeError' 

    end

    context 'outside a transaction' do
      let(:old_column) do
        double(:column,
               type: :integer,
               limit: 8,
               default: 0,
               null: false,
               precision: 5,
               scale: 1)
      end

      let(:trigger_name) { model.rename_trigger_name(:users, :old, :new) }

      before do
        allow(model).to receive(:transaction_open?).and_return(false)
        allow(model).to receive(:column_for).and_return(old_column)

        # Since MySQL and PostgreSQL use different quoting styles we'll just
        # stub the methods used for this to make testing easier.
        allow(model).to receive(:quote_column_name) { |name| name.to_s }
        allow(model).to receive(:quote_table_name) { |name| name.to_s }
      end

      context 'using MySQL' do
        it 'renames a column concurrently' 

      end

      context 'using PostgreSQL' do
        it 'renames a column concurrently' 

      end
    end
  end

  describe '#cleanup_concurrent_column_rename' do
    it 'cleans up the renaming procedure for PostgreSQL' 


    it 'cleans up the renaming procedure for MySQL' 

  end

  describe '#change_column_type_concurrently' do
    it 'changes the column type' 

  end

  describe '#cleanup_concurrent_column_type_change' do
    it 'cleans up the type changing procedure' 

  end

  describe '#install_rename_triggers_for_postgresql' do
    it 'installs the triggers for PostgreSQL' 

  end

  describe '#install_rename_triggers_for_mysql' do
    it 'installs the triggers for MySQL' 

  end

  describe '#remove_rename_triggers_for_postgresql' do
    it 'removes the function and trigger' 

  end

  describe '#remove_rename_triggers_for_mysql' do
    it 'removes the triggers' 

  end

  describe '#rename_trigger_name' do
    it 'returns a String' 

  end

  describe '#indexes_for' do
    it 'returns the indexes for a column' 

  end

  describe '#foreign_keys_for' do
    it 'returns the foreign keys for a column' 

  end

  describe '#copy_indexes' do
    context 'using a regular index using a single column' do
      it 'copies the index' 

    end

    context 'using a regular index with multiple columns' do
      it 'copies the index' 

    end

    context 'using an index with a WHERE clause' do
      it 'copies the index' 

    end

    context 'using an index with a USING clause' do
      it 'copies the index' 

    end

    context 'using an index with custom operator classes' do
      it 'copies the index' 

    end

    describe 'using an index of which the name does not contain the source column' do
      it 'raises RuntimeError' 

    end
  end

  describe '#copy_foreign_keys' do
    it 'copies foreign keys from one column to another' 

  end

  describe '#column_for' do
    it 'returns a column object for an existing column' 


    it 'returns nil when a column does not exist' 

  end

  describe '#replace_sql' do
    context 'using postgres' do
      before do
        allow(Gitlab::Database).to receive(:mysql?).and_return(false)
      end

      it 'builds the sql with correct functions' 

    end

    context 'using mysql' do
      before do
        allow(Gitlab::Database).to receive(:mysql?).and_return(true)
      end

      it 'builds the sql with the correct functions' 

    end

    describe 'results' do
      let!(:user) { create(:user, name: 'Kathy Alice Aliceson') }

      it 'replaces the correct part of the string' 

    end
  end

  describe 'sidekiq migration helpers', :sidekiq, :redis do
    let(:worker) do
      Class.new do
        include Sidekiq::Worker
        sidekiq_options queue: 'test'
      end
    end

    describe '#sidekiq_queue_length' do
      context 'when queue is empty' do
        it 'returns zero' 

      end

      context 'when queue contains jobs' do
        it 'returns correct size of the queue' 

      end
    end

    describe '#migrate_sidekiq_queue' do
      it 'migrates jobs from one sidekiq queue to another' 

    end
  end

  describe '#check_trigger_permissions!' do
    it 'does nothing when the user has the correct permissions' 


    it 'raises RuntimeError when the user does not have the correct permissions' 

  end

  describe '#bulk_queue_background_migration_jobs_by_range', :sidekiq do
    context 'when the model has an ID column' do
      let!(:id1) { create(:user).id }
      let!(:id2) { create(:user).id }
      let!(:id3) { create(:user).id }

      before do
        User.class_eval do
          include EachBatch
        end
      end

      context 'with enough rows to bulk queue jobs more than once' do
        before do
          stub_const('Gitlab::Database::MigrationHelpers::BACKGROUND_MIGRATION_JOB_BUFFER_SIZE', 1)
        end

        it 'queues jobs correctly' 


        it 'queues jobs in groups of buffer size 1' 

      end

      context 'with not enough rows to bulk queue jobs more than once' do
        it 'queues jobs correctly' 


        it 'queues jobs in bulk all at once (big buffer size)' 

      end

      context 'without specifying batch_size' do
        it 'queues jobs correctly' 

      end
    end

    context "when the model doesn't have an ID column" do
      it 'raises error (for now)' 

    end
  end

  describe '#queue_background_migration_jobs_by_range_at_intervals', :sidekiq do
    context 'when the model has an ID column' do
      let!(:id1) { create(:user).id }
      let!(:id2) { create(:user).id }
      let!(:id3) { create(:user).id }

      around do |example|
        Timecop.freeze { example.run }
      end

      before do
        User.class_eval do
          include EachBatch
        end
      end

      context 'with batch_size option' do
        it 'queues jobs correctly' 

      end

      context 'without batch_size option' do
        it 'queues jobs correctly' 

      end
    end

    context "when the model doesn't have an ID column" do
      it 'raises error (for now)' 

    end
  end

  describe '#change_column_type_using_background_migration' do
    let!(:issue) { create(:issue, :closed, closed_at: Time.zone.now) }

    let(:issue_model) do
      Class.new(ActiveRecord::Base) do
        self.table_name = 'issues'
        include EachBatch
      end
    end

    it 'changes the type of a column using a background migration' 

  end

  describe '#perform_background_migration_inline?' do
    it 'returns true in a test environment' 


    it 'returns true in a development environment' 


    it 'returns false in a production environment' 

  end

  describe '#index_exists_by_name?' do
    it 'returns true if an index exists' 


    it 'returns false if the index does not exist' 


    context 'when an index with a function exists', :postgresql do
      before do
        ActiveRecord::Base.connection.execute(
          'CREATE INDEX test_index ON projects (LOWER(path));'
        )
      end

      after do
        'DROP INDEX IF EXISTS test_index;'
      end

      it 'returns true if an index exists' 

    end
  end
end

