require 'spec_helper'

RSpec.describe Mysql2::Error do
  let(:error) do
    begin
      @client.query("HAHAHA")
    rescue Mysql2::Error => e
      error = e
    end

    error
  end

  it "responds to error_number and sql_state, with aliases" 


  context 'encoding' do
    let(:valid_utf8) { '造字' }
    let(:error) do
      begin
        @client.query(valid_utf8)
      rescue Mysql2::Error => e
        e
      end
    end

    let(:invalid_utf8) { ["e5c67d1f"].pack('H*').force_encoding(Encoding::UTF_8) }
    let(:bad_err) do
      begin
        @client.query(invalid_utf8)
      rescue Mysql2::Error => e
        e
      end
    end

    before do
      # sanity check
      expect(valid_utf8.encoding).to eql(Encoding::UTF_8)
      expect(valid_utf8).to be_valid_encoding

      expect(invalid_utf8.encoding).to eql(Encoding::UTF_8)
      expect(invalid_utf8).to_not be_valid_encoding
    end

    it "returns error messages as UTF-8 by default" 


    it "returns sql state as ASCII" 


    it "returns error messages and sql state in Encoding.default_internal if set" 

  end
end

