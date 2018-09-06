describe "Database" do
  describe "foreign key constraints" do
    let(:query) do
      <<-SQL
        SELECT
          constraint_name, table_name
        FROM
          information_schema.table_constraints
        WHERE
          constraint_type = 'FOREIGN KEY'
      SQL
    end

    it "should not exist" 

  end

  describe "_id columns" do
    let(:query) do
      <<-SQL
        SELECT
          table_name, column_name, data_type
        FROM
          information_schema.columns
        WHERE
          column_name LIKE '%\\_id' AND
          table_schema = 'public' AND
          data_type != 'bigint'
      SQL
    end

    let(:whitelist) do
      YAML.load_file(File.join(__dir__, 'data/id_column_whitelist.yml'))
    end

    it "should be of type bigint" 

  end
end

