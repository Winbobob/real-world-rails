require 'spec_helper'

RSpec.describe Mysql2::Result do
  before(:each) do
    @result = @client.query "SELECT 1"
  end

  it "should raise a TypeError exception when it doesn't wrap a result set" 


  it "should have included Enumerable" 


  it "should respond to #each" 


  it "should respond to #free" 


  it "should raise a Mysql2::Error exception upon a bad query" 


  it "should respond to #count, which is aliased as #size" 


  it "should be able to return the number of rows in the result set" 


  context "metadata queries" do
    it "should show tables" 

  end

  context "#each" do
    it "should yield rows as hash's" 


    it "should yield rows as hash's with symbol keys if :symbolize_keys was set to true" 


    it "should be able to return results as an array" 


    it "should cache previously yielded results by default" 


    it "should not cache previously yielded results if cache_rows is disabled" 


    it "should be able to iterate a second time even if cache_rows is disabled" 


    it "should yield different value for #first if streaming" 


    it "should yield the same value for #first if streaming is disabled" 


    it "should throw an exception if we try to iterate twice when streaming is enabled" 

  end

  context "#fields" do
    let(:test_result) { @client.query("SELECT * FROM mysql2_test ORDER BY id DESC LIMIT 1") }

    it "method should exist" 


    it "should return an array of field names in proper order" 

  end

  context "streaming" do
    it "should maintain a count while streaming" 


    it "should retain the count when mixing first and each" 


    it "should not yield nil at the end of streaming" 


    it "#count should be zero for rows after streaming when there were no results" 


    it "should raise an exception if streaming ended due to a timeout" 

  end

  context "row data type mapping" do
    let(:test_result) { @client.query("SELECT * FROM mysql2_test ORDER BY id DESC LIMIT 1").first }

    it "should return nil values for NULL and strings for everything else when :cast is false" 


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

  context "server flags" do
    let(:test_result) { @client.query("SELECT * FROM mysql2_test ORDER BY null_test DESC LIMIT 1") }

    it "should set a definitive value for query_was_slow" 

    it "should set a definitive value for no_index_used" 

    it "should set a definitive value for no_good_index_used" 

  end
end

