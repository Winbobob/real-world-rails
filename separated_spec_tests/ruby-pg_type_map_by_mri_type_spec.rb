# -*- rspec -*-
# encoding: utf-8

require_relative '../helpers'

require 'pg'


describe PG::TypeMapByMriType do

	let!(:textenc_int){ PG::TextEncoder::Integer.new name: 'INT4', oid: 23 }
	let!(:textenc_float){ PG::TextEncoder::Float.new name: 'FLOAT8', oid: 701 }
	let!(:textenc_string){ PG::TextEncoder::String.new name: 'TEXT', oid: 25 }
	let!(:binaryenc_int){ PG::BinaryEncoder::Int8.new name: 'INT8', oid: 20, format: 1 }
	let!(:pass_through_type) do
		type = Class.new(PG::SimpleEncoder) do
			def encode(*v)
				v.inspect
			end
		end.new
		type.oid = 25
		type.format = 0
		type.name = 'pass_through'
		type
	end

	let!(:tm) do
		tm = PG::TypeMapByMriType.new
		tm['T_FIXNUM'] = binaryenc_int
		tm['T_FLOAT'] = textenc_float
		tm['T_SYMBOL'] = pass_through_type
		tm
	end

	let!(:derived_tm) do
		tm = Class.new(PG::TypeMapByMriType) do
			def array_type_map_for(value)
				PG::TextEncoder::Array.new name: '_INT4', oid: 1007, elements_type: PG::TextEncoder::Integer.new
			end
		end.new
		tm['T_FIXNUM'] = proc{|value| textenc_int }
		tm['T_REGEXP'] = proc{|value| :invalid }
		tm['T_ARRAY'] = :array_type_map_for
		tm
	end

	it "should retrieve all conversions" 


	it "should retrieve particular conversions" 


	it "should allow deletion of coders" 


	it "should check MRI type key" 


	it "forwards query param conversions to the #default_type_map" 


	#
	# Decoding Examples
	#

	it "should raise an error when used for results" 


	#
	# Encoding Examples
	#

	it "should allow mixed type conversions" 


	it "should allow mixed type conversions with derived type map" 


	it "should raise TypeError with derived type map" 


end

