require 'rails_helper'
require_dependency 'migration/table_dropper'

describe Migration::TableDropper do

  def table_exists?(table_name)
    sql = <<~SQL
      SELECT 1
      FROM INFORMATION_SCHEMA.TABLES
      WHERE table_schema = 'public' AND
            table_name = '#{table_name}'
    SQL

    ActiveRecord::Base.exec_sql(sql).to_a.length > 0
  end

  def update_first_migration_date(created_at)
    ActiveRecord::Base.exec_sql(<<~SQL, created_at: created_at)
        UPDATE schema_migration_details
        SET created_at = :created_at
        WHERE id = (SELECT MIN(id)
                    FROM schema_migration_details)
    SQL
  end

  def create_new_table
    ActiveRecord::Base.exec_sql "CREATE TABLE table_with_new_name (topic_id INTEGER)"
  end

  let(:migration_name) do
    ActiveRecord::Base
      .exec_sql("SELECT name FROM schema_migration_details ORDER BY id DESC LIMIT 1")
      .getvalue(0, 0)
  end

  before do
    ActiveRecord::Base.exec_sql "CREATE TABLE table_with_old_name (topic_id INTEGER)"

    ActiveRecord::Base.exec_sql(<<~SQL, name: migration_name, created_at: 15.minutes.ago)
      UPDATE schema_migration_details
      SET created_at = :created_at
      WHERE name = :name
    SQL
  end

  context "first migration was a long time ago" do
    before do
      update_first_migration_date(2.years.ago)
    end

    describe ".delayed_rename" do
      it "can drop a table after correct delay and when new table exists" 

    end

    describe ".delayed_drop" do
      it "can drop a table after correct delay" 

    end
  end

  context "first migration was a less than 10 minutes ago" do
    describe ".delayed_rename" do
      it "can drop a table after correct delay and when new table exists" 

    end

    describe ".delayed_drop" do
      it "immediately drops the table" 

    end
  end
end

