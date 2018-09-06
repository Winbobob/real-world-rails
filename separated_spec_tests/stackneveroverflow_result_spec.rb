#!/usr/bin/env rspec
# encoding: utf-8

require_relative '../helpers'

require 'pg'


describe PG::Result do

	it "acts as an array of hashes" 


	it "yields a row as an array" 


	it "yields a row as an Enumerator" 

		expect( e.size ).to eq( 1 )
		expect( e.to_a ).to eq [['1', '2']]
	end

	it "yields a row as an Enumerator of hashs" 

		expect( e.size ).to eq( 1 )
		expect( e.to_a ).to eq [{'a'=>'1', 'b'=>'2'}]
	end

	context "result streaming", :postgresql_92 do
		it "can iterate over all tuples in single row mode" 

			@conn.set_single_row_mode
			expect(
				@conn.get_result.stream_each.to_a
			).to eq(
				[{'a'=>"2"}, {'a'=>"3"}, {'a'=>"4"}]
			)
			expect(
				@conn.get_result.enum_for(:stream_each).to_a
			).to eq(
				[{'b'=>"1", 'c'=>"5"}, {'b'=>"1", 'c'=>"6"}]
			)
			expect( @conn.get_result ).to be_nil
		end

		it "can iterate over all rows in single row mode" 

			@conn.set_single_row_mode
			expect(
				@conn.get_result.enum_for(:stream_each_row).to_a
			).to eq(
				[["2"], ["3"], ["4"]]
			)
			expect(
				@conn.get_result.stream_each_row.to_a
			).to eq(
				[["1", "5"], ["1", "6"]]
			)
			expect( @conn.get_result ).to be_nil
		end

		it "complains when not in single row mode" 

			expect{
				@conn.get_result.stream_each_row.to_a
			}.to raise_error(PG::InvalidResultStatus, /not in single row mode/)
		end

		it "complains when intersected with get_result" 

			@conn.set_single_row_mode
			expect{
				@conn.get_result.stream_each_row.each{ @conn.get_result }
			}.to raise_error(PG::NoResultError, /no result received/)
		end

		it "raises server errors" 

			expect{
				@conn.get_result.stream_each_row.to_a
			}.to raise_error(PG::DivisionByZero)
		end
	end

	it "inserts nil AS NULL and return NULL as nil" 


	it "encapsulates errors in a PGError object" 


		result = exception.result

		expect( result ).to be_a( described_class() )
		expect( result.error_field(PG::PG_DIAG_SEVERITY) ).to eq( 'ERROR' )
		expect( result.error_field(PG::PG_DIAG_SQLSTATE) ).to eq( '42P01' )
		expect(
			result.error_field(PG::PG_DIAG_MESSAGE_PRIMARY)
		).to eq( 'relation "nonexistant_table" does not exist' )
		expect( result.error_field(PG::PG_DIAG_MESSAGE_DETAIL) ).to be_nil()
		expect( result.error_field(PG::PG_DIAG_MESSAGE_HINT) ).to be_nil()
		expect( result.error_field(PG::PG_DIAG_STATEMENT_POSITION) ).to eq( '15' )
		expect( result.error_field(PG::PG_DIAG_INTERNAL_POSITION) ).to be_nil()
		expect( result.error_field(PG::PG_DIAG_INTERNAL_QUERY) ).to be_nil()
		expect( result.error_field(PG::PG_DIAG_CONTEXT) ).to be_nil()
		expect(
			result.error_field(PG::PG_DIAG_SOURCE_FILE)
		).to match( /parse_relation\.c$|namespace\.c$/ )
		expect( result.error_field(PG::PG_DIAG_SOURCE_LINE) ).to match( /^\d+$/ )
		expect(
			result.error_field(PG::PG_DIAG_SOURCE_FUNCTION)
		).to match( /^parserOpenTable$|^RangeVarGetRelid$/ )
	end

	it "encapsulates database object names for integrity constraint violations", :postgresql_93 do
		@conn.exec( "CREATE TABLE integrity (id SERIAL PRIMARY KEY)" )
		exception = nil
		begin
			@conn.exec( "INSERT INTO integrity VALUES (NULL)" )
		rescue PGError => err
			exception = err
		end
		result = exception.result

		expect( result.error_field(PG::PG_DIAG_SCHEMA_NAME) ).to eq( 'public' )
		expect( result.error_field(PG::PG_DIAG_TABLE_NAME) ).to eq( 'integrity' )
		expect( result.error_field(PG::PG_DIAG_COLUMN_NAME) ).to eq( 'id' )
		expect( result.error_field(PG::PG_DIAG_DATATYPE_NAME) ).to be_nil
		expect( result.error_field(PG::PG_DIAG_CONSTRAINT_NAME) ).to be_nil
	end

	it "detects division by zero as SQLSTATE 22012" 

		expect( sqlstate ).to eq( 22012 )
	end

	it "returns the same bytes in binary format that are sent in binary format" 


	it "returns the same bytes in binary format that are sent as inline text" 


	it "returns the same bytes in text format that are sent in binary format" 


	it "returns the same bytes in text format that are sent as inline text" 


	it "returns the parameter type of the specified prepared statement parameter", :postgresql_92 do
		query = 'SELECT * FROM pg_stat_activity WHERE user = $1::name AND query = $2::text'
		@conn.prepare( 'queryfinder', query )
		res = @conn.describe_prepared( 'queryfinder' )

		expect(
			@conn.exec( 'SELECT format_type($1, -1)', [res.paramtype(0)] ).getvalue( 0, 0 )
		).to eq( 'name' )
		expect(
			@conn.exec( 'SELECT format_type($1, -1)', [res.paramtype(1)] ).getvalue( 0, 0 )
		).to eq( 'text' )
	end

	it "raises an exception when a negative index is given to #fformat" 


	it "raises an exception when a negative index is given to #fmod" 


	it "raises an exception when a negative index is given to #[]" 


	it "raises allow for conversion to an array of arrays" 


	# PQfmod
	it "can return the type modifier for a result column" 


	it "raises an exception when an invalid index is passed to PG::Result#fmod" 


	it "raises an exception when an invalid (negative) index is passed to PG::Result#fmod" 


	it "doesn't raise an exception when a valid index is passed to PG::Result#fmod for a" +
	   " column with no typemod" do
		@conn.exec( 'CREATE TABLE fmodtest ( foo text )' )
		res = @conn.exec( 'SELECT * FROM fmodtest' )
		expect( res.fmod(0) ).to eq( -1 )
	end

	# PQftable
	it "can return the oid of the table from which a result column was fetched" 


	it "raises an exception when an invalid index is passed to PG::Result#ftable" 


	it "raises an exception when an invalid (negative) index is passed to PG::Result#ftable" 


	it "doesn't raise an exception when a valid index is passed to PG::Result#ftable for a " +
	   "column with no corresponding table" do
		@conn.exec( 'CREATE TABLE ftabletest ( foo text )' )
		res = @conn.exec( 'SELECT foo, LENGTH(foo) as length FROM ftabletest' )
		expect( res.ftable(1) ).to eq( PG::INVALID_OID )
	end

	# PQftablecol
	it "can return the column number (within its table) of a column in a result" 


	it "raises an exception when an invalid index is passed to PG::Result#ftablecol" 


	it "raises an exception when an invalid (negative) index is passed to PG::Result#ftablecol" 


	it "doesnn't raise an exception when a valid index is passed to PG::Result#ftablecol for a " +
	   "column with no corresponding table" do
		@conn.exec( 'CREATE TABLE ftablecoltest ( foo text )' )
		res = @conn.exec( 'SELECT foo, LENGTH(foo) as length FROM ftablecoltest' )
		expect( res.ftablecol(1) ).to eq( 0 )
	end

	it "can be manually checked for failed result status (async API)" 

		res = @conn.get_result
		expect {
			res.check
		}.to raise_error( PG::Error, /relation "nonexistant_table" does not exist/ )
	end

	it "can return the values of a single field" 


	it "raises a proper exception for a nonexistant table" 


	it "raises a more generic exception for an unknown SQLSTATE" 

	end

	it "raises a ServerError for an unknown SQLSTATE class" 

	end

	it "raises a proper exception for a nonexistant schema" 


	it "the raised result is nil in case of a connection error" 

			expect( error.result ).to eq( nil )
		}
	end

	it "does not clear the result itself" 


	it "can be inspected before and after clear" 


	context 'result value conversions with TypeMapByColumn' do
		let!(:textdec_int){ PG::TextDecoder::Integer.new name: 'INT4', oid: 23 }
		let!(:textdec_float){ PG::TextDecoder::Float.new name: 'FLOAT4', oid: 700 }

		it "should allow reading, assigning and diabling type conversions" 


		it "should be applied to all value retrieving methods" 


		it "should be usable for several querys" 


		it "shouldn't allow invalid type maps" 

	end
end

