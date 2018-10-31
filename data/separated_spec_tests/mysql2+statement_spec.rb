require './spec/spec_helper.rb'

RSpec.describe Mysql2::Statement do
  before :each do
    @client = new_client(encoding: "utf8")
  end

  def stmt_count
    # Use the performance schema in MySQL 5.7 and above
    @client.query("SELECT COUNT(1) AS count FROM performance_schema.prepared_statements_instances").first['count'].to_i
  rescue Mysql2::Error
    # Fall back to the global prepapred statement counter
    @client.query("SHOW STATUS LIKE 'Prepared_stmt_count'").first['Value'].to_i
  end

  it "should create a statement" 


  it "should raise an exception when server disconnects" 


  it "should tell us the param count" 


  it "should tell us the field count" 


  it "should let us execute our statement" 


  it "should raise an exception without a block" 


  it "should tell us the result count" 


  it "should let us iterate over results" 


  it "should handle booleans" 


  it "should handle bignum but in int64_t" 


  it "should handle bignum but beyond int64_t" 


  it "should accept keyword arguments on statement execute" 


  it "should accept bind arguments and keyword arguments on statement execute" 


  it "should keep its result after other query" 


  it "should be reusable 1000 times" 


  it "should be reusable 10000 times" 


  it "should handle comparisons and likes" 


  it "should select dates" 


  it "should prepare Date values" 


  it "should prepare Time values with microseconds" 


  it "should prepare DateTime values with microseconds" 


  it "should tell us about the fields" 


  it "should handle as a decimal binding a BigDecimal" 


  it "should update a DECIMAL value passing a BigDecimal" 


  it "should warn but still work if cache_rows is set to false" 


  context "utf8_db" do
    before(:each) do
      @client.query("DROP DATABASE IF EXISTS test_mysql2_stmt_utf8")
      @client.query("CREATE DATABASE test_mysql2_stmt_utf8")
      @client.query("USE test_mysql2_stmt_utf8")
      @client.query("CREATE TABLE テーブル (整数 int, 文字列 varchar(32)) charset=utf8")
      @client.query("INSERT INTO テーブル (整数, 文字列) VALUES (1, 'イチ'), (2, '弐'), (3, 'さん')")
    end

    after(:each) do
      @client.query("DROP DATABASE test_mysql2_stmt_utf8")
    end

    it "should be able to retrieve utf8 field names correctly" 


    it "should be able to retrieve utf8 param query correctly" 


    it "should be able to retrieve query with param in different encoding correctly" 

  end

  context "streaming result" do
    it "should be able to stream query result" 

  end

  context "#each" do
    # note: The current impl. of prepared statement requires results to be cached on #execute except for streaming queries
    #       The drawback of this is that args of Result#each is ignored...

    it "should yield rows as hash's" 


    it "should yield rows as hash's with symbol keys if :symbolize_keys was set to true" 


    it "should be able to return results as an array" 


    it "should cache previously yielded results by default" 


    it "should yield different value for #first if streaming" 


    it "should yield the same value for #first if streaming is disabled" 


    it "should throw an exception if we try to iterate twice when streaming is enabled" 

  end

  context "#fields" do
    it "method should exist" 


    it "should return an array of field names in proper order" 


    it "should return nil for statement with no result fields" 

  end

  context "row data type mapping" do
    let(:test_result) { @client.prepare("SELECT * FROM mysql2_test ORDER BY id DESC LIMIT 1").execute.first }

    it "should return nil for a NULL value" 


    it "should return String for a BIT(64) value" 


    it "should return String for a BIT(1) value" 


    it "should return Fixnum for a TINYINT value" 


    context "cast booleans for TINYINT if :cast_booleans is enabled" do
      # rubocop:disable Style/Semicolon
      let(:id1) { @client.query 'INSERT INTO mysql2_test (bool_cast_test) VALUES ( 1)'; @client.last_id }
      let(:id2) { @client.query 'INSERT INTO mysql2_test (bool_cast_test) VALUES ( 0)'; @client.last_id }
      let(:id3) { @client.query 'INSERT INTO mysql2_test (bool_cast_test) VALUES (-1)'; @client.last_id }
      # rubocop:enable Style/Semicolon

      after do
        @client.query "DELETE from mysql2_test WHERE id IN(#{id1},#{id2},#{id3})"
      end

      it "should return TrueClass or FalseClass for a TINYINT value if :cast_booleans is enabled" 

    end

    context "cast booleans for BIT(1) if :cast_booleans is enabled" do
      # rubocop:disable Style/Semicolon
      let(:id1) { @client.query 'INSERT INTO mysql2_test (single_bit_test) VALUES (1)'; @client.last_id }
      let(:id2) { @client.query 'INSERT INTO mysql2_test (single_bit_test) VALUES (0)'; @client.last_id }
      # rubocop:enable Style/Semicolon

      after do
        @client.query "DELETE from mysql2_test WHERE id IN(#{id1},#{id2})"
      end

      it "should return TrueClass or FalseClass for a BIT(1) value if :cast_booleans is enabled" 

    end

    it "should return Fixnum for a SMALLINT value" 


    it "should return Fixnum for a MEDIUMINT value" 


    it "should return Fixnum for an INT value" 


    it "should return Fixnum for a BIGINT value" 


    it "should return Fixnum for a YEAR value" 


    it "should return BigDecimal for a DECIMAL value" 


    it "should return Float for a FLOAT value" 


    it "should return Float for a DOUBLE value" 


    it "should return Time for a DATETIME value when within the supported range" 


    it "should return Time when timestamp is < 1901-12-13 20:45:52" 


    it "should return Time when timestamp is > 2038-01-19T03:14:07" 


    it "should return Time for a TIMESTAMP value when within the supported range" 


    it "should return Time for a TIME value" 


    it "should return Date for a DATE value" 


    it "should return String for an ENUM value" 


    it "should raise an error given an invalid DATETIME" 


    context "string encoding for ENUM values" do
      it "should default to the connection's encoding if Encoding.default_internal is nil" 


      it "should use Encoding.default_internal" 

    end

    it "should return String for a SET value" 


    context "string encoding for SET values" do
      it "should default to the connection's encoding if Encoding.default_internal is nil" 


      it "should use Encoding.default_internal" 

    end

    it "should return String for a BINARY value" 


    context "string encoding for BINARY values" do
      it "should default to binary if Encoding.default_internal is nil" 


      it "should not use Encoding.default_internal" 

    end

    {
      'char_test' => 'CHAR',
      'varchar_test' => 'VARCHAR',
      'varbinary_test' => 'VARBINARY',
      'tiny_blob_test' => 'TINYBLOB',
      'tiny_text_test' => 'TINYTEXT',
      'blob_test' => 'BLOB',
      'text_test' => 'TEXT',
      'medium_blob_test' => 'MEDIUMBLOB',
      'medium_text_test' => 'MEDIUMTEXT',
      'long_blob_test' => 'LONGBLOB',
      'long_text_test' => 'LONGTEXT',
    }.each do |field, type|
      it "should return a String for #{type}" 


      context "string encoding for #{type} values" do
        if %w[VARBINARY TINYBLOB BLOB MEDIUMBLOB LONGBLOB].include?(type)
          it "should default to binary if Encoding.default_internal is nil" 


          it "should not use Encoding.default_internal" 

        else
          it "should default to utf-8 if Encoding.default_internal is nil" 


          it "should use Encoding.default_internal" 

        end
      end
    end
  end

  context 'last_id' do
    before(:each) do
      @client.query 'USE test'
      @client.query 'CREATE TABLE IF NOT EXISTS lastIdTest (`id` BIGINT NOT NULL AUTO_INCREMENT, blah INT(11), PRIMARY KEY (`id`))'
    end

    after(:each) do
      @client.query 'DROP TABLE lastIdTest'
    end

    it 'should return last insert id' 


    it 'should handle bigint ids' 

  end

  context 'affected_rows' do
    before :each do
      @client.query 'USE test'
      @client.query 'CREATE TABLE IF NOT EXISTS lastIdTest (`id` BIGINT NOT NULL AUTO_INCREMENT, blah INT(11), PRIMARY KEY (`id`))'
    end

    after :each do
      @client.query 'DROP TABLE lastIdTest'
    end

    it 'should return number of rows affected by an insert' 


    it 'should return number of rows affected by an update' 


    it 'should return number of rows affected by a delete' 

  end

  context 'close' do
    it 'should free server resources' 


    it 'should raise an error on subsequent execution' 

  end
end

