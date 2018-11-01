# -*- rspec -*-
# encoding: utf-8

require_relative '../helpers'

require 'pg'


describe PG::TypeMapByColumn do

	let!(:textenc_int){ PG::TextEncoder::Integer.new name: 'INT4', oid: 23 }
	let!(:textdec_int){ PG::TextDecoder::Integer.new name: 'INT4', oid: 23 }
	let!(:textenc_float){ PG::TextEncoder::Float.new name: 'FLOAT4', oid: 700 }
	let!(:textdec_float){ PG::TextDecoder::Float.new name: 'FLOAT4', oid: 700 }
	let!(:textenc_string){ PG::TextEncoder::String.new name: 'TEXT', oid: 25 }
	let!(:textdec_string){ PG::TextDecoder::String.new name: 'TEXT', oid: 25 }
	let!(:textdec_bytea){ PG::TextDecoder::Bytea.new name: 'BYTEA', oid: 17 }
	let!(:binaryenc_bytea){ PG::BinaryEncoder::Bytea.new name: 'BYTEA', oid: 17, format: 1 }
	let!(:binarydec_bytea){ PG::BinaryDecoder::Bytea.new name: 'BYTEA', oid: 17, format: 1 }
	let!(:pass_through_type) do
		type = Class.new(PG::SimpleDecoder) do
			def decode(*v)
				v
			end
		end.new
		type.oid = 123456
		type.format = 1
		type.name = 'pass_through'
		type
	end

	it "should retrieve it's conversions" 


	it "should retrieve it's oids" 


	it "should gracefully handle not initialized state" 

		end.new

		expect{ @conn.exec_params( "SELECT $1", [ 0 ], 0, not_init ) }.to raise_error(NotImplementedError)

		res = @conn.exec( "SELECT 1" )
		expect{ res.type_map = not_init }.to raise_error(NotImplementedError)

		@conn.copy_data("COPY (SELECT 1) TO STDOUT") do
			decoder = PG::TextDecoder::CopyRow.new(type_map: not_init)
			expect{ @conn.get_copy_data(false, decoder) }.to raise_error(NotImplementedError)
			@conn.get_copy_data
		end
	end


	#
	# Encoding Examples
	#

	it "should encode integer params" 


	it "should encode bytea params" 



	it "should allow hash form parameters for default encoder" 


	it "should convert hash form parameters to string when using string encoders" 


	it "shouldn't allow param mappings with different number of fields" 


	it "should verify the default type map for query params as well" 


	it "forwards query param conversions to the #default_type_map" 


	#
	# Decoding Examples
	#

	class Exception_in_decode < PG::SimpleDecoder
		def decode(res, tuple, field)
			raise "no type decoder defined for tuple #{tuple} field #{field}"
		end
	end

	it "should raise an error from decode method of type converter" 


	it "should raise an error for invalid params" 


	it "shouldn't allow result mappings with different number of fields" 


	it "should verify the default type map for result values as well" 


	it "forwards result value conversions to a TypeMapByOid as #default_type_map" 

	end

	it "forwards get_copy_data conversions to another TypeMapByColumn as #default_type_map" 

	end

	it "will deny copy queries with different column count" 

		end
	end

	#
	# Decoding Examples text format
	#

	it "should allow mixed type conversions" 


end

