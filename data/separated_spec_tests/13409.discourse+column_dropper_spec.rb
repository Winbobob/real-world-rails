require 'rails_helper'
require_dependency 'migration/column_dropper'

RSpec.describe Migration::ColumnDropper do
  def has_column?(table, column)
    DB.exec(<<~SQL, table: table, column: column) == 1
      SELECT 1
      FROM INFORMATION_SCHEMA.COLUMNS
      WHERE
        table_schema = 'public' AND
        table_name = :table AND
        column_name = :column
    SQL
  end

  describe ".execute_drop" do
    let(:columns) { %w{junk junk2} }

    before do
      columns.each do |column|
        DB.exec("ALTER TABLE topics ADD COLUMN #{column} int")
      end
    end

    after do
      columns.each do |column|
        DB.exec("ALTER TABLE topics DROP COLUMN IF EXISTS #{column}")
      end
    end

    it "drops the columns" 

  end

  describe '.mark_readonly' do
    let(:table_name) { "table_with_readonly_column" }

    before do
      DB.exec <<~SQL
      CREATE TABLE #{table_name} (topic_id INTEGER, email TEXT);

      INSERT INTO #{table_name} (topic_id, email)
      VALUES (1, 'something@email.com');
      SQL

      Migration::ColumnDropper.mark_readonly(table_name, 'email')
    end

    after do
      ActiveRecord::Base.connection.reset!

      DB.exec <<~SQL
      DROP TABLE IF EXISTS #{table_name};
      DROP FUNCTION IF EXISTS #{Migration::BaseDropper.readonly_function_name(table_name, 'email')} CASCADE;
      SQL
    end

    it 'should be droppable' 


    it 'should prevent updates to the readonly column' 


    it 'should allow updates to the other columns' 


    it 'should prevent insertions to the readonly column' 


    it 'should allow insertions to the other columns' 

  end
end

