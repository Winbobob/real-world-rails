#!/usr/bin/env rspec
# encoding: utf-8

require_relative '../helpers'

require 'pg'


describe PG::TypeMapByOid do

	let!(:textdec_int){ PG::TextDecoder::Integer.new name: 'INT4', oid: 23 }
	let!(:textdec_float){ PG::TextDecoder::Float.new name: 'FLOAT8', oid: 701 }
	let!(:textdec_string){ PG::TextDecoder::String.new name: 'TEXT', oid: 25 }
	let!(:textdec_bytea){ PG::TextDecoder::Bytea.new name: 'BYTEA', oid: 17 }
	let!(:binarydec_float){ PG::BinaryDecoder::Float.new name: 'FLOAT8', oid: 701, format: 1 }
	let!(:pass_through_type) do
		type = Class.new(PG::SimpleDecoder) do
			def decode(*v)
				v
			end
		end.new
		type.oid = 1082
		type.format = 0
		type.name = 'pass_through'
		type
	end

	let!(:tm) do
		tm = PG::TypeMapByOid.new
		tm.add_coder textdec_int
		tm.add_coder textdec_float
		tm.add_coder binarydec_float
		tm.add_coder pass_through_type
		tm
	end

	it "should retrieve it's conversions" 


	it "should allow deletion of coders" 


	it "should check format when deleting coders" 


	it "should check format when adding coders" 


	it "should check coder type when adding coders" 


	it "should allow reading and writing max_rows_for_online_lookup" 


	it "should allow building new TypeMapByColumn for a given result" 


	it "forwards result value conversions to another TypeMapByOid as #default_type_map" 

	end

	#
	# Decoding Examples text format
	#

	it "should allow mixed type conversions in text format" 


	it "should build a TypeMapByColumn when assigned and the number of rows is high enough" 


	it "should use TypeMapByOid for online lookup and the number of rows is low enough" 


	#
	# Decoding Examples binary format
	#

	it "should allow mixed type conversions in binary format" 


	#
	# Encoding Examples
	#

	it "should raise an error used for query params" 


end

