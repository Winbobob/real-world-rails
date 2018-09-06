require 'rails_helper'
require_dependency 'migration/column_dropper'

RSpec.describe Migration::ColumnDropper do

  def has_column?(table, column)
    ActiveRecord::Base.exec_sql(<<~SQL, table: table, column: column).to_a.length == 1
      SELECT 1
      FROM INFORMATION_SCHEMA.COLUMNS
      WHERE
        table_schema = 'public' AND
        table_name = :table AND
        column_name = :column
    SQL
  end

  def update_first_migration_date(created_at)
    ActiveRecord::Base.exec_sql(<<~SQL, created_at: created_at)
        UPDATE schema_migration_details
        SET created_at = :created_at
        WHERE id = (SELECT MIN(id)
                    FROM schema_migration_details)
    SQL
  end

  describe ".drop" do
    let(:migration_name) do
      ActiveRecord::Base
        .exec_sql("SELECT name FROM schema_migration_details ORDER BY id DESC LIMIT 1")
        .getvalue(0, 0)
    end

    before do
      Topic.exec_sql "ALTER TABLE topics ADD COLUMN junk int"

      ActiveRecord::Base.exec_sql(<<~SQL, name: migration_name, created_at: 15.minutes.ago)
        UPDATE schema_migration_details
        SET created_at = :created_at
        WHERE name = :name
      SQL
    end

    it "can correctly drop columns after correct delay" 


    it "drops the columns immediately if the first migration was less than 10 minutes ago" 

  end

  describe '.mark_readonly' do
    let(:table_name) { "table_with_readonly_column" }

    before do
      ActiveRecord::Base.exec_sql <<~SQL
      CREATE TABLE #{table_name} (topic_id INTEGER, email TEXT);

      INSERT INTO #{table_name} (topic_id, email)
      VALUES (1, 'something@email.com');
      SQL

      Migration::ColumnDropper.mark_readonly(table_name, 'email')
    end

    after do
      ActiveRecord::Base.connection.reset!

      ActiveRecord::Base.exec_sql <<~SQL
      DROP TABLE IF EXISTS #{table_name};
      DROP TRIGGER IF EXISTS #{table_name}_email_readonly ON #{table_name};
      SQL
    end

    it 'should be droppable' 

    it 'should prevent updates to the readonly column' 


    it 'should allow updates to the other columns' 


    it 'should prevent insertions to the readonly column' 


    it 'should allow insertions to the other columns' 

  end
end

